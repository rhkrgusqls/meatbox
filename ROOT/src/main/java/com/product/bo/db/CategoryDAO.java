package com.product.bo.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import jdbc.db.connection.DBConnectionManager;

public class CategoryDAO {
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

    // 기존 관리자 기능 (수정 없음)
    /**
     * @param childCode 이 카테고리 코드가
     * @param parentCode 이 카테고리 하위로 들어가게 됨
     * @throws SQLException
     */
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
     * 특정 카테고리 ID로 DTO를 조회하는 헬퍼 메서드 (추가)
     */
    public CategoryDTO getCategoryById(int categoryId) {
        CategoryDTO dto = null;
        sql = "SELECT category_id, category_name, parent_category_id FROM category_hierarchy WHERE category_id = ?";
        try {
            con = DBConnectionManager.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, categoryId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new CategoryDTO();
                dto.setCategoryId(rs.getInt("category_id"));
                dto.setCategoryName(rs.getString("category_name"));
                int parentId = rs.getInt("parent_category_id");
                if (!rs.wasNull()) {
                    dto.setParentCategoryId(parentId);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return dto;
    }

    /**
     * 현재 카테고리 ID를 기반으로 최상위 부모 카테고리를 찾는 메서드 (추가)
     */
    public CategoryDTO findTopLevelParent(int categoryId) {
        CategoryDTO currentCategory = getCategoryById(categoryId);
        if (currentCategory == null) {
            return null; // 카테고리가 없는 경우
        }
        
        // 부모 ID가 없을 때까지(최상위 카테고리에 도달할 때까지) 반복해서 부모를 조회
        while (currentCategory.getParentCategoryId() != null) {
            currentCategory = getCategoryById(currentCategory.getParentCategoryId());
            if (currentCategory == null) {
                return null; // 중간에 부모를 못 찾는 경우 (데이터 오류)
            }
        }
        return currentCategory; // 최상위 부모 DTO 반환
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
    
    /**
     * 최상위 카테고리만 조회하는 메서드 (자식 카테고리 추가 시 <select>에 사용)
     */
    public List<CategoryDTO> getTopLevelCategories() {
        List<CategoryDTO> categoryList = new ArrayList<>();
        // level이 0인 카테고리만 조회
        sql = "SELECT category_id, category_name FROM category_hierarchy WHERE level = 0 ORDER BY category_name";

        try {
            con = DBConnectionManager.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoryDTO dto = new CategoryDTO();
                dto.setCategoryId(rs.getInt("category_id"));
                dto.setCategoryName(rs.getString("category_name"));
                categoryList.add(dto);
            }
            System.out.println("DAO : 최상위 카테고리 " + categoryList.size() + "개 조회 완료");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return categoryList;
    }

    /**
     * 모든 카테고리 목록을 계층 구조로 가져오는 메서드 (개선된 최종본)
     * 최상위 카테고리 목록을 반환하며, 각 DTO는 자신의 자식 목록을 포함합니다.
     */
    public List<CategoryDTO> getAllCategoriesHierarchical() {
        // 1. 모든 카테고리를 DB에서 가져와 ID를 key로 하는 Map에 저장 (조회를 빠르게 하기 위함)
        Map<Integer, CategoryDTO> allCategoriesMap = new HashMap<>();
        sql = "SELECT category_id, category_name, parent_category_id FROM category_hierarchy ORDER BY category_name";

        try {
            con = DBConnectionManager.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoryDTO dto = new CategoryDTO();
                dto.setCategoryId(rs.getInt("category_id"));
                dto.setCategoryName(rs.getString("category_name"));
                
                int parentId = rs.getInt("parent_category_id");
                if (!rs.wasNull()) {
                    dto.setParentCategoryId(parentId);
                }
                allCategoriesMap.put(dto.getCategoryId(), dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>(); // 오류 발생 시 빈 리스트 반환
        } finally {
            closeDB();
        }

        // 2. Map에 저장된 모든 카테고리를 순회하며 부모-자식 관계를 설정
        List<CategoryDTO> topLevelCategories = new ArrayList<>();
        for (CategoryDTO category : allCategoriesMap.values()) {
            if (category.getParentCategoryId() == null) {
                // 부모 ID가 없으면 최상위 카테고리이므로 결과 리스트에 바로 추가
                topLevelCategories.add(category);
            } else {
                // 부모 ID가 있으면, Map에서 부모를 찾아서 자식 리스트에 자신을 추가
                CategoryDTO parent = allCategoriesMap.get(category.getParentCategoryId());
                if (parent != null) {
                    parent.getChildren().add(category);
                }
            }
        }
        
        System.out.println("DAO : 계층형 카테고리 구조화 완료, 최상위 " + topLevelCategories.size() + "개");
        return topLevelCategories;
    }


    /**
     * 새로운 최상위 카테고리를 추가하는 메서드 (추가)
     */
    public void addTopLevelCategory(String categoryName) throws SQLException {
        sql = "INSERT INTO category_hierarchy (category_name, level, parent_category_id) VALUES (?, 0, NULL)";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, categoryName);
            pstmt.executeUpdate();
            System.out.println("DAO : 새 최상위 카테고리 '" + categoryName + "' 추가 완료");
        }
    }

    /**
     * 새로운 자식 카테고리를 추가하는 메서드 (추가)
     */
    public void addChildCategory(String categoryName, int parentId) throws SQLException {
        // 부모의 레벨을 조회하여 자식 레벨을 결정 (예: 부모가 0이면 자식은 1, 부모가 1이면 자식은 2)
        int parentLevel = 0;
        String levelSql = "SELECT level FROM category_hierarchy WHERE category_id = ?";
        sql = "INSERT INTO category_hierarchy (category_name, level, parent_category_id) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnectionManager.getConnection()) {
            // 부모 레벨 조회
            try (PreparedStatement levelPstmt = conn.prepareStatement(levelSql)) {
                levelPstmt.setInt(1, parentId);
                try (ResultSet levelRs = levelPstmt.executeQuery()) {
                    if (levelRs.next()) {
                        parentLevel = levelRs.getInt("level");
                    }
                }
            }
            
            // 자식 카테고리 삽입
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, categoryName);
                pstmt.setInt(2, parentLevel + 1); // 부모 레벨 + 1
                pstmt.setInt(3, parentId);
                pstmt.executeUpdate();
                System.out.println("DAO : '" + parentId + "'의 자식 카테고리 '" + categoryName + "' 추가 완료");
            }
        }
    }
    /**
     * 카테고리 이름을 수정하는 메서드 (추가)
     */
    public void updateCategory(int categoryId, String newName) throws SQLException {
        sql = "UPDATE category_hierarchy SET category_name = ? WHERE category_id = ?";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, newName);
            pstmt.setInt(2, categoryId);
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("DAO : 카테고리 ID " + categoryId + "의 이름이 '" + newName + "'으로 변경되었습니다.");
            } else {
                System.out.println("DAO : 카테고리 ID " + categoryId + "에 해당하는 항목이 없어 업데이트에 실패했습니다.");
            }
        }
    }

    /**
     * 카테고리를 삭제하는 메서드 (추가)
     */
    public void deleteCategory(int categoryId) throws SQLException {
        // 중요: 자식 카테고리가 있는지 먼저 확인합니다.
        String checkSql = "SELECT COUNT(*) FROM category_hierarchy WHERE parent_category_id = ?";
        sql = "DELETE FROM category_hierarchy WHERE category_id = ?";
        
        try (Connection conn = DBConnectionManager.getConnection()) {
            // 자식 카테고리 확인
            try (PreparedStatement checkPstmt = conn.prepareStatement(checkSql)) {
                checkPstmt.setInt(1, categoryId);
                try (ResultSet rs = checkPstmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        // 자식이 있으면 예외를 발생시켜 삭제를 막습니다.
                        throw new SQLException("자식 카테고리가 존재하므로 삭제할 수 없습니다.");
                    }
                }
            }
            
            // 자식이 없으면 삭제 수행
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, categoryId);
                int result = pstmt.executeUpdate();

                if (result > 0) {
                    System.out.println("DAO : 카테고리 ID " + categoryId + "가 삭제되었습니다.");
                } else {
                    System.out.println("DAO : 카테고리 ID " + categoryId + "에 해당하는 항목이 없어 삭제에 실패했습니다.");
                }
            }
        }
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
    
    public void insertCategory(String categoryName) throws SQLException {
        String sql = "INSERT INTO category (category_name) VALUES (?)";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, categoryName);
            pstmt.executeUpdate();
            System.out.println("DAO : 새 카테고리 '" + categoryName + "' 추가 완료");
        } 
    }
    
    public List<com.product.seller.controller.CategoryBean> getLeafCategories() {
        List<com.product.seller.controller.CategoryBean> list = new ArrayList<>();
        String sql = "SELECT * FROM category_hierarchy ch " +
                     "WHERE ch.category_id NOT IN ( " +
                     "    SELECT DISTINCT parent_category_id " +
                     "    FROM category_hierarchy " +
                     "    WHERE parent_category_id IS NOT NULL " +
                     ")";

        try {
            con = DBConnectionManager.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
                list.add(new com.product.seller.controller.CategoryBean(id, name));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }

        return list;
    }
}