use axum::{extract::Path, http::StatusCode, Json};
use serde::{Deserialize, Serialize};

use crate::{db::get_conn, models::{element::Element, molecula::Molecula}};

#[derive(Serialize, Deserialize)]
pub struct SearchObject {
    pub elements: Vec<Element>,
    pub moleculas: Vec<Molecula>
}

pub async fn search_by_term(Path(term): Path<String>) -> (StatusCode, Result<Json<SearchObject>, String>)  {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let elements = match Element::search_many(&conn, &term).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let moleculas = match Molecula::search_many(&conn, &term).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    (StatusCode::OK, Ok(Json( SearchObject { elements, moleculas } )))
}