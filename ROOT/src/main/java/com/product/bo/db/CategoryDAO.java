package com.product.bo.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import jdbc.db.connection.DBConnectionManager;

public class CategoryDAO {

    /**
     * 자식 카테고리를 부모 카테고리에 맞춰 자동으로 레벨 지정
     * 이미 다른 카테고리의 부모라면 예외 발생
     * @param childCode 자식 카테고리 코드
     * @param parentCode 부모 카테고리 코드
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

    /**
     * Bean 객체로 호출 가능
     */
    public void classifyCategoryLevel(CategoryBean bean) throws SQLException {
        classifyCategoryLevel(bean.getChildCode(), bean.getParentCode());
    }
}
