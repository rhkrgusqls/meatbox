package com.product.bo.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.db.connection.DBConnectionManager;

public class CategoryDAO {
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

    // 기존 관리자 기능 (수정 없음)
    public void classifyCategoryLevel(String childCode, String parentCode) throws SQLException {
        try (Connection conn = DBConnectionManager.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL classify_category_level(?, ?)}")) {
            stmt.setString(1, childCode);
            stmt.setString(2, parentCode);
            stmt.execute();
        }
    }

    public void classifyCategoryLevel(CategoryBean bean) throws SQLException {
        classifyCategoryLevel(bean.getChildCode(), bean.getParentCode());
    }

    /**
     * 헤더 메뉴를 위한 카테고리 조회 (category_hierarchy 테이블 사용)
     */
    public List<CategoryDTO> getCategoriesByParent(Integer parentId) {
        List<CategoryDTO> categoryList = new ArrayList<>();
        
        // [수정] 'category_hierarchy' 테이블 하나만 사용하도록 쿼리를 최종 수정했습니다.
        sql = "SELECT " +
              "    h1.category_id, " +
              "    h1.category_name, " +
              "    h1.level, " +
              "    (SELECT CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END " +
              "     FROM category_hierarchy h2 " +
              "     WHERE h2.parent_category_id = h1.category_id) AS is_leaf " +
              "FROM category_hierarchy h1 " +
              "WHERE h1.parent_category_id <=> ?";

        try {
            con = DBConnectionManager.getConnection();
            pstmt = con.prepareStatement(sql);
            if (parentId == null) {
                pstmt.setNull(1, java.sql.Types.INTEGER);
            } else {
                pstmt.setInt(1, parentId);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoryDTO dto = new CategoryDTO();
                dto.setCategoryId(rs.getInt("category_id"));
                dto.setCategoryName(rs.getString("category_name"));
                dto.setLevel(rs.getInt("level"));
                dto.setLeaf(rs.getInt("is_leaf") == 1);
                categoryList.add(dto);
            }
            System.out.println("DAO : parentId " + parentId + "의 하위 카테고리 " + categoryList.size() + "개 조회 완료");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return categoryList;
    }

    public void closeDB() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}