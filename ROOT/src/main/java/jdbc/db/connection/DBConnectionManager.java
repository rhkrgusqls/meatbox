package jdbc.db.connection;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnectionManager {

    private static Connection connection = null;

    static {
        Properties prop = new Properties();

        String[] possiblePaths = {
            "classpath:dbconnection.properties",
            "./dbconnection.properties",
            "../dbconnection.properties"
        };

        try {
            InputStream input = null;

            for (String path : possiblePaths) {
                if (path.startsWith("classpath:")) {
                    input = DBConnectionManager.class.getClassLoader()
                            .getResourceAsStream(path.substring(10));
                } else {
                    try {
                        input = new FileInputStream(path);
                    } catch (IOException ignored) {
                        input = null;
                    }
                }

                if (input != null) {
                    break;
                }
            }

            if (input == null) {
                throw new RuntimeException("dbconnection.properties 파일을 찾을 수 없습니다.");
            }

            prop.load(input);

            String url = prop.getProperty("db.url");
            String user = prop.getProperty("db.user");
            String password = prop.getProperty("db.password");
            String driver = prop.getProperty("db.driver");

            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);

            System.out.println("DB 연결 성공");
            System.out.println("Current working directory: " + System.getProperty("user.dir"));

        } catch (IOException | ClassNotFoundException | java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return connection;
    }
}
