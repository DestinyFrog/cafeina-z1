use axum::{ routing::get,  Router };
use tower_http::{cors::{Any, CorsLayer}, services::ServeDir};
use tower::ServiceBuilder;

use routes::{route_element, route_molecula, route_search};
use config::load_api_config;

mod config;
mod routes;
mod models;
mod tools;
mod db;

async fn ping() -> &'static str {
    "pong"
}

fn router() -> Router {    
    let cors_layer = CorsLayer::new()
        .allow_origin(Any);

    let static_files = ServeDir::new("dist");

    Router::new()
        .route("/api", get(ping))
        .route("/api/element", get(route_element::get_elements))
        .route("/api/element/{atomic_number}", get(route_element::get_element_by_atomic_number))
        .route("/api/molecula", get(route_molecula::get_all))
        .route("/api/molecula/{uid}", get(route_molecula::get_molecula_by_uid))
        .route("/api/molecula/{uid}/view", get(route_molecula::get_view_svg))
        .route("/api/mix/{term}", get(route_molecula::get_molecula_by_term))
        .route("/api/search/{term}", get(route_search::search_by_term))
        
        .layer(ServiceBuilder::new().layer(cors_layer))
        .fallback_service(static_files)
}

#[tokio::main]
async fn main() {
    dotenvy::from_filename(".env").expect(".env not found");
    tracing_subscriber::fmt::init();

    let api_config = match load_api_config() {
        Ok(v) => v,
        Err(e) => panic!("{}", e.to_string())
    };

    let app = router();
    let listener = tokio::net::TcpListener::bind(format!("{}:{}", api_config.host, api_config.port)).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}