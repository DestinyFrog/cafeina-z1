use axum::{extract::Path, http::StatusCode, Json};
use serde::{Deserialize, Serialize};

use crate::{db::{conn::get_conn, table::Res}, models::{element::Element, molecula::Molecula}};

#[derive(Serialize, Deserialize)]
pub struct SearchObject {
    pub elements: Vec<Res>,
    pub moleculas: Vec<Res>
}

pub async fn search_by_term(Path(term): Path<String>)
    -> (StatusCode, Result<Json<SearchObject>, String>)
    {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let elements = match Element::search_for(&conn, &term).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let moleculas = match Molecula::search_for(&conn, &term).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    (StatusCode::OK, Ok(Json( SearchObject { elements, moleculas } )))
}