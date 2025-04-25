use axum::{ routing::get, Router };

use config::load_api_config;
use routes::{route_element, route_molecula};

mod config;
mod routes;
mod models;
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

    tracing_subscriber::fmt::init();

    let app = Router::new()
        .route("/", get(ping))

        .route("/element", get(route_element::get_elements))
        .route("/element/{atomic_number}", get(route_element::get_element_by_atomic_number))

        .route("/molecula/{uid}", get(route_molecula::get_molecula_by_uid))
        .route("/molecula", get(route_molecula::get_svg))
        ;

    let listener = tokio::net::TcpListener::bind(format!("{}:{}", api_config.host, api_config.port)).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}