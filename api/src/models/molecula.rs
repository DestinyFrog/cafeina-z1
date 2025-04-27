use libsql::{Connection, Row, Rows};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Molecula {
    uid: String,
    name: String,
    pub z1: String,
    term: String
}

impl Molecula {
    fn get_fields() -> Vec<String> {
        vec![
            String::from("uid"),
            String::from("name"),
            String::from("z1"),
            String::from("term")
        ]
    }

    async fn select_row(row: Row) -> Result<Molecula, Box<dyn std::error::Error>> {
        let uid: String = row.get(0)?;
        let name: String = row.get(1)?;
        let z1: String = row.get(2)?;
        let term: String = row.get(3)?;

        Ok(Molecula {
            uid,
            name,
            z1,
            term
        })
    }
    
    async fn select(mut rows: Rows) -> Result<Vec<Molecula>, Box<dyn std::error::Error>> {
        let mut moleculas: Vec<Molecula> = vec![];
        while let Some(row) = rows.next().await? {
            let molecula = Self::select_row(row).await?;
            moleculas.push(molecula);
        }
        Ok(moleculas)
    }

    pub async fn get_all(conn: Connection) -> Result<Vec<Molecula>, Box<dyn std::error::Error>> {
        let fields = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM molecula", fields);
        let rows: libsql::Rows = conn.query(query.as_str(), ()).await?;
        Ok(Self::select(rows).await?)
    }

    pub async fn get_molecula_by_uid(conn:&Connection, uid: String) -> Result<Option<Molecula>, Box<dyn std::error::Error>> {
        let fields = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM molecula WHERE uid = $1", fields);
        let mut rows: libsql::Rows = conn.query(query.as_str(), [uid]).await?;

        let row: Option<Row> = match rows.next().await {
            Ok(v) => v,
            Err(e) => return Err(Box::new(e)),
        };

        match row {
            Some(v) => {
                let molecula = Self::select_row(v).await?;
                Ok(Some(molecula))
            },
            None => Ok(None),
        }
    }

    pub async fn search_many(conn:&Connection, term:&str) -> Result<Vec<Molecula>, Box<dyn std::error::Error>> {
        let fields: String = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM molecula WHERE `name` LIKE $1", fields);
        
        let general_term = format!("%{}%", term);
        let rows: libsql::Rows = conn.query(query.as_str(), [general_term]).await?;
        Self::select(rows).await
    }
}