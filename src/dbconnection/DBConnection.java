package dbconnection;

import java.sql.Connection;
import java.util.Properties;

public abstract class DBConnection {
	
	protected Site site;
	protected String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	protected Connection connection;
	protected Properties properties;
	
	
	public DBConnection(Site site) {
		super();
		this.site = site;
	}
	
	public abstract Connection connect();
	public abstract void runQuery(String query);
	public abstract void close();
	

}
