package jdbc.db.connection;

import com.product.db.ProductDAO;
import com.product.db.ProductBean;
import java.sql.Connection;

public class TestDBConnection {
    public static void main(String[] args) {
        // 1️⃣ DB 연결 테스트
        try {
            Connection conn = DBConnectionManager.getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("[SUCCESS] DB connection established successfully.");
            } else {
                System.out.println("[FAIL] DB connection failed.");
                return;
            }
        } catch (Exception e) {
            System.out.println("[ERROR] DB connection test failed.");
            e.printStackTrace();
            return;
        }

        // 2️⃣ DAO 테스트
        try {
            ProductDAO dao = new ProductDAO();
            int testProductId = 5; // DB에 존재하는 product_id로 수정해 테스트
            ProductBean product = dao.product_detail(testProductId);

            if (product != null) {
                System.out.println("[SUCCESS] Product fetched successfully:");
                System.out.println("product_id = " + product.get_product_id());
                System.out.println("user_index = " + product.get_user_index());
                System.out.println("quantity = " + product.get_quantity());
                System.out.println("storage_type = " + product.get_storage_type());
                System.out.println("product_form = " + product.get_product_form());
                System.out.println("price = " + product.get_price());
                System.out.println("seller_note = " + product.get_seller_note());
            } else {
                System.out.println("[INFO] No product found with ID " + testProductId);
            }
        } catch (Exception e) {
            System.out.println("[ERROR] DAO test failed.");
            e.printStackTrace();
        }
    }
}
