package jdbc.db.connection;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionManager {

    private static String url;
    private static String user;
    private static String password;
    private static String driver;

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
                if (input != null) break;
            }

            if (input == null) throw new RuntimeException("dbconnection.properties 파일을 찾을 수 없습니다.");

            prop.load(input);

            url = prop.getProperty("db.url");
            user = prop.getProperty("db.user");
            password = prop.getProperty("db.password");
            driver = prop.getProperty("db.driver");

            Class.forName(driver);

            System.out.println("DB 드라이버 로드 성공");
            System.out.println("Current working directory: " + System.getProperty("user.dir"));

        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 매번 새로운 Connection 반환
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
}
