package com.user.db;

import jdbc.db.connection.DBConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressDAO {

    public AddressDTO getAddressByUserIndex(int userIndex) {
        AddressDTO address = null;
        String sql = "SELECT city, district, neighborhood, detail_address FROM address WHERE user_index = ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    address = new AddressDTO();
                    address.setCity(rs.getString("city"));
                    address.setDistrict(rs.getString("district"));
                    address.setNeighborhood(rs.getString("neighborhood"));
                    address.setDetailAddress(rs.getString("detail_address"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return address;
    }
}
