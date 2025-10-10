package jdbc.db.connection;

import com.user.register.db.RegisterDAO;
import com.user.register.db.RegisterException;

public class TestDBConnection {
    public static void main(String[] args) {
        RegisterDAO dao = new RegisterDAO();

        // ✅ 1. 일반 유저 등록 테스트
        try {
            int userIndex = dao.register_normaluser("test_normal121", "1234", "홍길동");
            System.out.println("✅ NORMAL USER 등록 성공: user_index = " + userIndex);
        } catch (RegisterException e) {
            System.err.println("❌ NORMAL USER 등록 실패: code = " + e.getMessage());
        }

        // ✅ 2. SELLER 유저 등록 테스트
        try {
            int sellerIndex = dao.register_selleruser(
                "test_seller121",
                "abcd1234",
                "상점주인",
                "1234567890",       // 사업자등록번호
                "테스트상점",         // 상호
                "김대표",           // 대표자명
                "Food",            // 업태 (식당)
                "정육판매",         // 업종
                "02-1234-5678",    // 전화번호
                "BUTCHER"          // 사업장 형태 (ENUM 값)
            );
            System.out.println("✅ SELLER USER 등록 성공: user_index = " + sellerIndex);
        } catch (RegisterException e) {
            System.err.println("❌ SELLER USER 등록 실패: code = " + e.getMessage());
        }
    }
}
