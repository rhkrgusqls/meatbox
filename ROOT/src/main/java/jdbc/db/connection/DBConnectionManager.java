package jdbc.db.connection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnectionManager {

    private static Connection connection = null;

    static {
        try {
            // 프로젝트 루트 기준 상대경로
        	FileInputStream input = new FileInputStream("C:\\workspace\\KDT\\git\\meatbox\\dbconnection.properties");


            System.out.println("Current working directory: " + System.getProperty("user.dir"));

            Properties prop = new Properties();
            prop.load(input);

            String url = prop.getProperty("db.url");
            String user = prop.getProperty("db.user");
            String password = prop.getProperty("db.password");
            String driver = prop.getProperty("db.driver");

            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);

        } catch (IOException | ClassNotFoundException | java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return connection;
    }
}
