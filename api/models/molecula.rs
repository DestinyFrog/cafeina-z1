use libsql::Connection;

use crate::db::table::{FieldType, Res, Table};

pub struct Molecula {}

impl Table for Molecula {
    fn get_fields() -> Vec<(&'static str, crate::db::table::FieldType)> {
        vec![
            ("uid",     FieldType::String),
            ("name",    FieldType::String),
        ]
    }
}

impl Molecula {
    pub async fn get_all(conn: &Connection)
        -> Result<Vec<Res>, Box<dyn std::error::Error>> {

        let query = format!("SELECT {} FROM molecula",
            Self::get_fields_str());

        let mut rows = conn.query(query.as_str(), ()).await?;
        Self::select_all(&mut rows).await
    }

    pub async fn get_one_by_uid(conn: &Connection, uid: &str)
        -> Result<Option<Res>, Box<dyn std::error::Error>> {

        let query = format!("SELECT {} FROM molecula WHERE uid = $1",
            Self::get_fields_str());

        let mut rows = conn.query(query.as_str(), [uid]).await?;
        Self::select_one(&mut rows).await
    }

    pub async fn get_z1_by_uid(conn: &Connection, uid: &str)
        -> Result<Option<String>, Box<dyn std::error::Error>> {

        let mut rows = conn.query("SELECT `z1` FROM molecula WHERE uid = $1", [uid]).await?;
        Ok(match Self::get_field(&mut rows, FieldType::String).await? {
            Some(t) => Some(serde_json::Value::to_string(&t)),
            None => None
        })
    }

    pub async fn search_for(conn: &Connection, term: &str)
        -> Result<Vec<Res>, Box<dyn std::error::Error>> {

        let query = format!("SELECT {} FROM molecula WHERE `name` LIKE $1",
            Self::get_fields_str());
        
        let general_term = format!("%{}%", term);
        let mut rows = conn.query(query.as_str(), [general_term]).await?;
        Self::select_all(&mut rows).await
    }

    pub async fn get_one_by_term(conn: &Connection, term: &str)
        -> Result<Option<Res>, Box<dyn std::error::Error>> {

        let query = format!("SELECT {} FROM molecula WHERE term = $1",
            Self::get_fields_str());
        
        let mut rows = conn.query(query.as_str(), [term]).await?;
        Self::select_one(&mut rows).await
    }
}