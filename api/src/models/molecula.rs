use libsql::{Connection, Row};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Molecula {
    uid: String,
    name: String,
    z1: Option<String>,
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
            z1: Some(z1),
            term
        })
    }

    pub async fn get_molecula_by_uid(conn: Connection, uid: String) -> Result<Option<Molecula>, Box<dyn std::error::Error>> {
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
}