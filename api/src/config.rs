use std::env;

pub struct ApiConfig {
    pub port: u16,
    pub host: String,
}

pub struct DbConfig {
    pub token: String,
    pub url: String
}

pub fn load_db_config() -> Result<DbConfig, env::VarError> {
    let token: String = env::var("TURSO_TOKEN")?;
    let url: String = env::var("TURSO_URL")?;
    Ok(DbConfig { token, url })
}

pub fn load_api_config() -> Result<ApiConfig, Box<dyn std::error::Error>> {
    let host: String = env::var("API_HOST")?;
    let port: u16 = env::var("API_PORT")?.parse()?;
    Ok(ApiConfig { host, port })
}