use std::env;

pub struct ApiConfig {
    pub port: u16,
    pub host: String,
    pub api_prefix: String
}

pub struct DbConfig {
    pub local_db: String,
    pub token: String,
    pub url: String
}

pub fn load_db_config() -> Result<DbConfig, env::VarError> {
    let local_db: String = env::var("LOCAL_DB")?;
    let token: String = env::var("TURSO_TOKEN")?;
    let url: String = env::var("TURSO_URL")?;
    Ok(DbConfig { token, url, local_db })
}

pub fn load_api_config() -> Result<ApiConfig, Box<dyn std::error::Error>> {
    let host: String = env::var("API_HOST")?;
    let port: u16 = env::var("API_PORT")?.parse()?;
    let api_prefix: String = env::var("API_PREFIX")?;
    Ok(ApiConfig { host, port, api_prefix })
}

pub fn load_mode() -> Result<String, env::VarError> {
    env::var("MODE")
}