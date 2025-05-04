use libsql;

use crate::config::{load_db_config, load_mode};

pub async fn get_conn() -> Result<libsql::Connection, Box<dyn std::error::Error>> {
    let db_config = load_db_config()?;
    let mode = load_mode()?;

    let db = match mode.as_str() {
        "DEV" => libsql::Builder::new_local(db_config.local_db).build().await?,
        _ => libsql::Builder::new_remote(db_config.url, db_config.token).build().await?
    };

    Ok(db.connect()?)
}