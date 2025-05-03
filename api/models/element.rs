use std::collections::HashMap;
use libsql::Connection;

use crate::db::table::{FieldType, Table};

pub struct Element {}

impl Table for Element {
    fn get_fields() -> Vec<(&'static str, FieldType)> {
        vec![
            ("atomic_number",               FieldType::Integer),
            ("oficial_name",                FieldType::String),
            ("symbol",                      FieldType::String),
            ("atomic_radius",               FieldType::NullableInteger),
            ("category",                    FieldType::String),
            ("fase",                        FieldType::String),
            ("atomic_mass",                 FieldType::NullableFloat),
            ("eletronegativity",            FieldType::NullableFloat),
            ("period",                      FieldType::Integer),
            ("family",                      FieldType::Integer),
            ("xpos",                        FieldType::Integer),
            ("ypos",                        FieldType::Integer),
            ("layers",                      FieldType::Json),
            ("electronic_configuration",    FieldType::String),
            ("oxidation_state",             FieldType::Json),
            ("discovery_year",              FieldType::NullableInteger),
            ("discovery",                   FieldType::Json),
            ("another_names",               FieldType::Json)
        ]
    }
}

impl Element {
    pub async fn get_all(conn: &Connection)
        -> Result<Vec<HashMap<String, serde_json::Value>>, Box<dyn std::error::Error>> {
        
        let query = format!("SELECT {} FROM element ORDER BY atomic_number",
            Self::get_fields_str());

        let mut rows = conn.query(query.as_str(), ()).await?;
        Self::select_all(&mut rows).await
    }

    pub async fn get_one_by_atomic_number(conn: &Connection, atomic_number: i32)
        -> Result<Option<HashMap<String, serde_json::Value>>, Box<dyn std::error::Error>> {
    
        let query = format!("SELECT {} FROM element WHERE atomic_number = ?",
            Self::get_fields_str());

        let mut rows = conn.query(query.as_str(), [atomic_number]).await?;
        Self::select_one(&mut rows).await
    }

    pub async fn search_for(conn: &Connection, term: &str)
        -> Result<Vec<HashMap<String, serde_json::Value>>, Box<dyn std::error::Error>> {

        let query = format!("SELECT {} FROM element WHERE
            `oficial_name` LIKE $1 OR
            `symbol` LIKE $1 OR
            `discovery` LIKE $1 OR
            `category` LIKE $1 OR
            `another_names` LIKE $1",
            Self::get_fields_str());
        
        let general_term = format!("%{}%", term);
        let mut rows = conn.query(query.as_str(), [general_term]).await?;
        Self::select_all(&mut rows).await
    }
}