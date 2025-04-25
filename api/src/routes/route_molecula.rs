use axum::{extract::Path, http::StatusCode, response::Html, Json};
use tokio::{fs::File, process::Command};

use crate::{db::get_conn, models::molecula::Molecula};

pub async fn get_molecula_by_uid(Path(uid):Path<String>) -> (StatusCode, Result<Json<Option<Molecula>>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let molecula = match Molecula::get_molecula_by_uid(conn, uid).await {
        Ok(d) => d,
        Err(err) => {
            println!("ERROR {}", err.to_string());
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    (StatusCode::OK, Ok(Json(molecula)))
}

pub async fn get_svg(Path(uid):Path<String>) -> (StatusCode, Result<Html<String>, String>) {
    let conn = match get_conn().await {
        Ok(d) => d,
        Err(err) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    let molecula = match Molecula::get_molecula_by_uid(conn, uid).await {
        Ok(d) => d,
        Err(err) => {
            println!("ERROR {}", err.to_string());
            return (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
        }
    };

    //todo write example.z1

    let mode = "standard";
    let mut z1 = Command::new("lua");
    z1.current_dir("../");
    z1.arg("z1/Print.lua").arg(mode).arg("example.z1");

    match z1.output().await {
        Ok(v) => {
            let output = String::from_utf8_lossy(&v.stdout);
            (StatusCode::OK, Ok(Html(output.to_string())))
        },
        Err(err) => (StatusCode::INTERNAL_SERVER_ERROR, Err(err.to_string()) )
    }
}

pub async fn get_z13() -> Result<String, String> {
    let mode = "standard";

    let mut z1 = Command::new("lua");
    z1.current_dir("../");
    z1.arg("z1/Print.lua").arg(mode).arg("example.z1");

    match z1.output().await {
        Ok(v) => {
            let output = String::from_utf8_lossy(&v.stdout);
            Ok(output.to_string())
        },
        Err(err) => Err(err.to_string())
    }
}