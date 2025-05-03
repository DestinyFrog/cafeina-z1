use std::collections::HashMap;

use libsql::{Row, Rows};
use serde_json::{from_str, json};

pub enum FieldType {
    Json,
    Integer,
    String,
    NullableFloat,
    NullableInteger
}

pub type Res = HashMap<String, serde_json::Value>;

impl FieldType {
    fn select_row(&self, row:&Row, idx:i32) -> Result<serde_json::Value, Box<dyn std::error::Error>> {
        Ok(
            match self {
                Self::Integer => {
                    let integer: i32 = row.get(idx)?;
                    json!(integer)
                },
                Self::String => {
                    let string: String = row.get_str(idx)?.to_string().to_owned();
                    json!(string)
                },
                Self::Json => {
                    let json: String = row.get_str(idx)?.to_string().to_owned();
                    from_str(&json)?
                },
                Self::NullableFloat => {
                    let float: Option<f64> = row.get_value(idx)?.as_real().copied();
                    json!(float)
                },
                Self::NullableInteger => {
                    let integer: Option<i64> = row.get_value(idx)?.as_integer().copied();
                    json!(integer)
                },
            }
        )
    }
}
pub trait Table {
    fn get_fields() -> Vec<(&'static str, FieldType)>;

    fn get_fields_str() -> String {
        let fields_str: Vec<&str> = Self::get_fields()
            .into_iter()
            .map(|(k, _)| { k })
            .collect();

        fields_str.join(",")
    }

    async fn select_all(rows: &mut Rows)
        -> Result<Vec<Res>, Box<dyn std::error::Error>> {
        let mut objs = vec![];

        while let Some(row) = rows.next().await? {
            let mut obj = HashMap::new();
    
            for (idx, (k, v)) in Self::get_fields().into_iter().enumerate() {
                let v = v.select_row(&row, idx.try_into().unwrap())?;
                obj.insert(k.to_string(), v);
            }

            objs.push(obj);
        }

        Ok(objs)
    }

    async fn select_one(rows: &mut Rows)
        -> Result<Option<Res>, Box<dyn std::error::Error>> {
        match rows.next().await? {
            Some(t) => {
                let mut obj = HashMap::new();
                for (idx, (k, v)) in Self::get_fields().into_iter().enumerate() {
                    let v = v.select_row(&t, idx.try_into().unwrap())?;
                    obj.insert(k.to_string(), v);
                }
                Ok(Some(obj))
            },
            None => Ok(None)
        }
    }

    async fn get_field(rows: &mut Rows, field_type: FieldType)
        -> Result<Option<serde_json::Value>, Box<dyn std::error::Error>> {
        match rows.next().await? {
            Some(t) => {
                let val = field_type.select_row(&t, 0)?;
                Ok(Some(val))
            },
            None => Ok(None)
        }
    }
}
