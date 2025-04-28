use axum::{extract::{Path, Query}, http::StatusCode, Json};
use serde::Deserialize;
use crate::{db::get_conn, models::molecula::Molecula, tools::z1::z1::{self, Z1Output}};

pub async fn get_all() -> (StatusCode, Result<Json<Vec<Molecula>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string())),
    };

    let moleculas = match Molecula::get_all(conn).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()));
        }
    };

    (StatusCode::OK, Ok(Json(moleculas)))
}

pub async fn get_molecula_by_uid(Path(uid): Path<String>) -> (StatusCode, Result<Json<Option<Molecula>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string())),
    };

    let molecula = match Molecula::get_molecula_by_uid(&conn, uid).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()));
        }
    };

    (StatusCode::OK, Ok(Json(molecula)))
}

#[derive(Deserialize)]
pub struct Z1Params {
    pub mode: Option<String>,
}

pub async fn get_view_svg(Path(uid): Path<String>, params: Query<Z1Params>) -> (StatusCode, Result<Z1Output, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string())),
    };

    let molecula = match Molecula::get_molecula_by_uid(&conn, uid).await {
        Ok(d) => match d {
            Some(v) => v,
            None => {
                return (StatusCode::NOT_FOUND, Err("Molecula não encontrada".to_owned()));
            }
        },
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()));
        }
    };

    let mode = match &params.mode { Some(v) => v, None => "standard" };

    match z1::molecula_to_z1(mode, &molecula) {
        Ok(v) => (StatusCode::OK, Ok(v)),
        Err(e) => (StatusCode::INTERNAL_SERVER_ERROR, Err(e.to_string()))
    }
}

pub async fn get_molecula_by_term(Path(term): Path<String>) -> (StatusCode, Result<Json<Option<Molecula>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string())),
    };

    let molecula = match Molecula::search_by_term(&conn, &term).await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()));
        }
    };

    (StatusCode::OK, Ok(Json(molecula)))
}
