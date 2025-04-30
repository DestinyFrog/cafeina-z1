use libsql;

use crate::config::load_db_config;

pub async fn get_conn() -> Result<libsql::Connection, Box<dyn std::error::Error>> {
    let db_config = load_db_config()?;

    let db = libsql::Builder::new_local(db_config.local_db)
        .build()
        .await?;

    Ok(db.connect()?)
}