package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection con = null;

	public static synchronized Connection getCon() {
		try {
			if (con != null && con.isValid(2)) {
				return con;
			}
		} catch (SQLException e) {
			con = null;
		}

		String host = env("DB_HOST", "localhost");
		String port = env("DB_PORT", "3306");
		String dbName = env("DB_NAME", "hms");
		String dbUsername = env("DB_USER", "root");
		String dbPassword = env("DB_PASSWORD", "bilz999");
		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName
				+ "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

		for (int attempt = 1; attempt <= 5; attempt++) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url, dbUsername, dbPassword);
				return con;
			} catch (Exception e) {
				e.printStackTrace();
				try {
					Thread.sleep(1500L);
				} catch (InterruptedException interrupted) {
					Thread.currentThread().interrupt();
					break;
				}
			}
		}
		return con;
	}

	private static String env(String key, String fallback) {
		String value = System.getenv(key);
		if (value == null || value.trim().isEmpty()) {
			return fallback;
		}
		return value;
	}
}
