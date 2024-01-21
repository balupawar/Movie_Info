package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDatabase {

	public static Connection getCon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedatabase", "root", "Balu@213391");
		} catch (Exception e) {
			System.out.println(e);
		}
		if (con != null) {
			return con;
		}

		return null;
	}
}
