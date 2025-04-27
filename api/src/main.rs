use axum::{ routing::get, Router };
use tower_http::cors::{CorsLayer, Any};
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

#[tokio::main]
async fn main() {
    dotenvy::from_filename("../.env").expect(".env not found");

    let api_config = match load_api_config() {
        Ok(v) => v,
        Err(e) => panic!("{}", e.to_string())
    };

    let cors_layer = CorsLayer::new()
        .allow_origin(Any);

    tracing_subscriber::fmt::init();

    let app = Router::new()
        .route("/", get(ping))
        .route("/element", get(route_element::get_elements))
        .route("/element/{atomic_number}", get(route_element::get_element_by_atomic_number))
        .route("/search/{term}", get(route_search::search_by_term))
        .route("/molecula", get(route_molecula::get_all))
        .route("/molecula/{uid}", get(route_molecula::get_molecula_by_uid))
        .route("/molecula/{uid}/view", get(route_molecula::get_view_svg))
        .layer(ServiceBuilder::new().layer(cors_layer));

    let listener = tokio::net::TcpListener::bind(format!("{}:{}", api_config.host, api_config.port)).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}