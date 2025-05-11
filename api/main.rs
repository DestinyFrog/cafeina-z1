use axum::{ routing::get,  Router };
use tower_http::{cors::CorsLayer, services::ServeDir};

use routes::{route_element, route_molecula, route_search};
use config::{load_api_config, load_mode};

mod config;
mod routes;
mod models;
mod tools;
mod db;

async fn ping() -> &'static str {
    "pong"
}

fn path(route:&str) -> String {
    let prefix = match load_api_config() {
        Ok(t) => t.api_prefix,
        Err(_) => "/api/v1".to_string()
    };
    format!("{}{}", prefix, route)
}

fn router() -> Router {
    let static_files = ServeDir::new("dist");

    Router::new()
        .route(&path("/ping"),                      get(ping))
        .route(&path("/element"),                   get(route_element::get_elements))
        .route(&path("/element/{atomic_number}"),   get(route_element::get_element_by_atomic_number))
        .route(&path("/molecula"),                  get(route_molecula::get_all))
        .route(&path("/molecula/{uid}"),            get(route_molecula::get_molecula_by_uid))
        .route(&path("/molecula/{uid}/view"),       get(route_molecula::get_view_svg))
        .route(&path("/mix/{term}"),                get(route_molecula::get_molecula_by_term))
        .route(&path("/search/{term}"),             get(route_search::search_by_term))

        .layer(CorsLayer::permissive())
        .fallback_service(static_files)
}

#[tokio::main]
async fn main() {
    match load_mode() {
        Ok(t) => match t.as_str() {
            "PROD" => {},
            _ => { dotenvy::from_filename(".env").expect(".env not found"); }
        },
        Err(_) => { dotenvy::from_filename(".env").expect(".env not found"); }
    };

    tracing_subscriber::fmt::init();

    let api_config = match load_api_config() {
        Ok(v) => v,
        Err(e) => panic!("{}", e.to_string())
    };

    let app = router();
    let listener = tokio::net::TcpListener::bind(format!("{}:{}", api_config.host, api_config.port)).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}