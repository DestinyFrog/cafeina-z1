use libsql::{Connection, Row, Rows};
use serde::{Deserialize, Serialize};
use serde_json::from_str;

#[derive(Serialize, Deserialize)]
pub struct Element {
    atomic_number: i32,
    oficial_name: String,
    symbol: String,
    atomic_radius: Option<i64>,
    category: String,
    atomic_mass: Option<f64>,
    eletronegativity: Option<f64>,
    period: i32,
    family: i32,
    fase: String,
    xpos: i32,
    ypos: i32,
    layers: Vec<i64>,
    electronic_configuration: String,
    oxidation_state: Vec<i32>,
    discovery_year: Option<i64>,
}

impl Element {
    fn get_fields() -> Vec<String> {
        vec![
            String::from("atomic_number"),
            String::from("oficial_name"),
            String::from("symbol"),
            String::from("atomic_radius"),
            String::from("category"),
            String::from("atomic_mass"),
            String::from("eletronegativity"),
            String::from("period"),
            String::from("family"),
            String::from("xpos"),
            String::from("ypos"),
            String::from("layers"),
            String::from("electronic_configuration"),
            String::from("oxidation_state"),
            String::from("discovery_year"),
            String::from("fase")
        ]
    }

    async fn select_row(row: Row) -> Result<Element, Box<dyn std::error::Error>> {
        let atomic_number: i32 = row.get(0)?;
        let oficial_name: String = row.get(1)?;
        let symbol: String = row.get(2)?;
        let atomic_radius = row.get_value(3).unwrap().as_integer().copied();
        let category: String = row.get(4)?;
        let atomic_mass = row.get_value(5)?.as_real().copied();
        let eletronegativity: Option<f64> = row.get_value(6)?.as_real().copied();
        let period: i32 = row.get(7)?;
        let family: i32 = row.get(8)?;
        let xpos: i32 = row.get(9)?;
        let ypos: i32 = row.get(10)?;
        let layers = from_str(row.get_str(11)?)?;
        let electronic_configuration: String = row.get(12)?;
        let oxidation_state = from_str(row.get_str(13)?)?;
        let discovery_year = row.get_value(14)?.as_integer().copied();
        let fase:String = row.get(15)?;

        Ok(Element {
            atomic_number,
            oficial_name,
            symbol,
            atomic_radius,
            category,
            atomic_mass,
            eletronegativity,
            period,
            family,
            xpos,
            ypos,
            electronic_configuration,
            layers,
            oxidation_state,
            discovery_year,
            fase
        })
    }

    async fn select(mut rows: Rows) -> Result<Vec<Element>, Box<dyn std::error::Error>> {
        let mut elements: Vec<Element> = vec![];
        while let Some(row) = rows.next().await? {
            let element = Self::select_row(row).await?;
            elements.push(element);
        }
        Ok(elements)
    }

    pub async fn get_all(conn: Connection) -> Result<Vec<Element>, Box<dyn std::error::Error>> {
        let fields = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM element ORDER BY atomic_number", fields);

        let rows: libsql::Rows = conn.query(query.as_str(), ()).await?;
        Self::select(rows).await
    }

    pub async fn get_one_by_atomic_number(conn: Connection, atomic_number: i32) -> Result<Option<Element>, Box<dyn std::error::Error>> {
        let fields = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM element WHERE atomic_number = $1", fields);
        let mut rows: libsql::Rows = conn.query(query.as_str(), [atomic_number]).await?;

        let row: Option<Row> = match rows.next().await {
            Ok(v) => v,
            Err(e) => return Err(Box::new(e)),
        };

        match row {
            Some(v) => {
                let element = Self::select_row(v).await?;
                Ok(Some(element))
            },
            None => Ok(None),
        }
    }

    pub async fn search_many(conn:&Connection, term:&str) -> Result<Vec<Element>, Box<dyn std::error::Error>> {
        let fields: String = Self::get_fields().join(",");
        let query = format!("SELECT {} FROM element
            WHERE
                `oficial_name` LIKE $1 OR
                `symbol` LIKE $1 OR
                `category` LIKE $1 OR
                `discovery` LIKE $1
                ", fields);

        let general_term = format!("%{}%", term);
        let rows: libsql::Rows = conn.query(query.as_str(), [general_term]).await?;
        Self::select(rows).await
    }
}
