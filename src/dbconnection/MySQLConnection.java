package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class MySQLConnection extends DBConnection {

	public MySQLConnection(Site site) {
		super(site);
	}

	public Connection connect() {
		System.out.println("Conectando com site: " + this.site.getId());
		if (connection == null) {
			try {
				Class.forName(DATABASE_DRIVER);
				connection = DriverManager.getConnection(this.site.getUrl(), getProperties());
				System.out.println("Conectado com sucesso ao site: " + this.site.getId());
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("Erro ao conectar com site: " + this.site.getId());
				e.printStackTrace();
			}
		}
		return connection;
	}

	public void runQuery(String query) {
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);

			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {		
				String row = "|";
				for (int i = 1; i <= columnsNumber; i++) {
					row = row.concat("| "+rsmd.getColumnName(i)+" : "+ rs.getString(i) + " |");
				}
				for (int i = 0 ; i < row.length() ; i++) {
					System.out.print("-");					
				}
				System.out.println();
				System.out.println(row);
				for (int i = 0 ; i < row.length() ; i++) {
					System.out.print("-");					
				}
				System.out.println();
			
			}
			
			st.close();
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}

	}

	public void close() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Site getSite() {
		return this.site;
	}

	private Properties getProperties() {
		if (properties == null) {
			properties = new Properties();
			properties.setProperty("user", this.site.getUsername());
			properties.setProperty("password", this.site.getPassword());
		}
		return properties;
	}

}
