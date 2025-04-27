pub mod z1 {
    use axum::{
        http::StatusCode,
        response::{Html, IntoResponse},
    };
    use std::{io::{ErrorKind, Write}, process::{Command, Stdio}};
    use tempfile::NamedTempFile;

    use crate::models::molecula::Molecula;

    //todo specify Z1Error

    pub enum Z1Output {
        SVG(String),
        Z13(String),
    }

    impl IntoResponse for Z1Output {
        fn into_response(self) -> axum::response::Response {
            match self {
                Z1Output::SVG(v) => (StatusCode::OK, Html(v)).into_response(),
                Z1Output::Z13(v) => (StatusCode::OK, v).into_response(),
            }
        }
    }

    fn run_command(mode:&str, file_name:&str) -> Result<String, Box<dyn std::error::Error>> {
        let output = Command::new("lua")
            .current_dir("../")
            .arg("z1/Print.lua")
            .arg(mode)
            .arg(file_name)
            .stdout(Stdio::piped())
            .spawn()?
            .wait_with_output()?;

        Ok(String::from_utf8_lossy(&output.stdout).to_string())
    }

    fn handle_mode(mode:&str, output:String) -> Result<Z1Output, String> {
        match mode {
            "standard" => Ok(Z1Output::SVG(output)),
            "z13" => Ok(Z1Output::Z13(output)),
            _ => Err(String::from("unknown mode"))
        }
    }

    pub fn molecula_to_z1(mode:&str, molecula:&Molecula) -> Result<Z1Output, Box<dyn std::error::Error>> {
        let mut file = NamedTempFile::new()?;
        writeln!(file, "{}", molecula.z1)?;
        let file_name = match file.path().to_str() {
            Some(v) => Ok(v.to_owned()),
            None => Err(Box::new(std::io::Error::new(
                ErrorKind::InvalidData,
                "file path not found",
            ))),
        }?;
        
        let output = run_command(mode, &file_name)?;
        Ok(handle_mode(mode, output)?)
    }
}