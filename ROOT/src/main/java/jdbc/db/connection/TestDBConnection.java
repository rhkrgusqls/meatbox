package jdbc.db.connection;

import com.product.db.ProductDAO;
import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;
import com.product.db.ProductBean;
import java.sql.Connection;

public class TestDBConnection {
    public static void main(String[] args) {
        RegisterDAO dao = new RegisterDAO();

        // 1️⃣ 정상 회원가입 테스트
        try {
            int result1 = dao.register_normaluser("testuser2", "1234", "홍길동");
            System.out.println("회원가입 성공, user_index: " + result1);
        } catch (RegisterException e) {
            System.out.println("회원가입 실패: " + e.getMessage());
        }

        // 2️⃣ 중복 ID 테스트
        try {
            int result2 = dao.register_normaluser("testuser1", "1234", "홍길동");
            System.out.println("회원가입 성공, user_index: " + result2);
        } catch (RegisterException e) {
            System.out.println("중복 ID 테스트 실패: " + e.getMessage());
        }

        // 3️⃣ 빈 ID 입력 테스트
        try {
            int result3 = dao.register_normaluser("", "1234", "홍길동");
            System.out.println("회원가입 성공, user_index: " + result3);
        } catch (RegisterException e) {
            System.out.println("빈 ID 입력 테스트 실패: " + e.getMessage());
        }

        // 4️⃣ 빈 비밀번호 입력 테스트
        try {
            int result4 = dao.register_normaluser("testuser2", "", "홍길동");
            System.out.println("회원가입 성공, user_index: " + result4);
        } catch (RegisterException e) {
            System.out.println("빈 비밀번호 입력 테스트 실패: " + e.getMessage());
        }

        // 5️⃣ 빈 이름 입력 테스트
        try {
            int result5 = dao.register_normaluser("testuser3", "1234", "");
            System.out.println("회원가입 성공, user_index: " + result5);
        } catch (RegisterException e) {
            System.out.println("빈 이름 입력 테스트 실패: " + e.getMessage());
        }
    }
}
