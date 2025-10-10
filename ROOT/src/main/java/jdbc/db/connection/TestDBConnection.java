package jdbc.db.connection;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDBConnection {
    public static void main(String[] args) {
        Connection conn = DBConnectionManager.getConnection();
        if (conn != null) {
            try {
                if (!conn.isClosed()) {
                    System.out.println("DB connection successful!");
                } else {
                    System.out.println("DB connection failed: connection is closed");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("DB connection failed: connection is null");
        }
    }
}
