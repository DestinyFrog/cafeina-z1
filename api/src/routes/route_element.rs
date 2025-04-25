use axum::extract::Path;
use axum::{ http::StatusCode, Json };

use crate::models::element::Element;
use crate::db::get_conn;

pub async fn get_elements() -> (StatusCode, Result<Json<Vec<Element>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let elements = match Element::get_all(conn).await {
        Ok(d) => d,
        Err(err) => {
            println!("ERROR {}", err.to_string());
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    (StatusCode::OK, Ok(Json(elements)))
}

pub async fn get_element_by_atomic_number(Path(atomic_number):Path<i32>) -> (StatusCode, Result<Json<Option<Element>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let element = match Element::get_one_by_atomic_number(conn, atomic_number).await {
        Ok(d) => d,
        Err(err) => {
            println!("ERROR {}", err.to_string());
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    (StatusCode::OK, Ok(Json(element)))
}