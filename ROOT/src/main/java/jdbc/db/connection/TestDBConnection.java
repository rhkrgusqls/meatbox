package jdbc.db.connection;

import com.product.db.ProductDAO;
import com.user.login.db.LoginDAO;
import com.user.login.db.LoginException;
import com.user.login.db.LoginResultBean;
import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;
import com.product.db.ProductBean;
import java.sql.Connection;

public class TestDBConnection {
    public static void main(String[] args) {
        LoginDAO dao = new LoginDAO();

        try {
            LoginResultBean result1 = dao.login("testuser2", "1234");
            System.out.println("로그인 성공, user_index: " + result1.getUserIndex() 
                + ", role: " + result1.getRole());
        } catch (LoginException e) {
            System.out.println("로그인 실패: " + e.getMessage());
        }
    }
}
