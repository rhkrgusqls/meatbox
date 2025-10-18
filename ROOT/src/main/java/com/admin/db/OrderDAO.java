package com.admin.db;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.product.bo.db.ProductRegisterApproveDAO;
import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;

import jdbc.db.connection.DBConnectionManager;

public class OrderDAO {
	// 주문 + 상품 정보를 담을 DTO	
	public List<JoinedOrderData> getAllOrdersWithProducts() {
	    List<JoinedOrderData> resultList = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmtOrder = null;
	    PreparedStatement pstmtProductIds = null;
	    ResultSet rsOrder = null;
	    ResultSet rsProductIds = null;
	    ProductDAO pDAO = new ProductDAO();
	    try {
	        conn = DBConnectionManager.getConnection();
	
	        // 1. _order 테이블에서 모든 주문 조회
	        String orderSQL = "SELECT * FROM _order";
	        pstmtOrder = conn.prepareStatement(orderSQL);
	        rsOrder = pstmtOrder.executeQuery();
	
	        while (rsOrder.next()) {
	            JoinedOrderData joinedOrder = new JoinedOrderData();
	            joinedOrder.setOrderId(rsOrder.getInt("order_id"));
	            joinedOrder.setUserIndex(rsOrder.getInt("user_index"));
	            joinedOrder.setPaymentMethodId(rsOrder.getInt("payment_method_id"));
	            joinedOrder.setDiscountAmount(rsOrder.getInt("discount_amount"));
	            joinedOrder.setShippingFee(rsOrder.getInt("shipping_fee"));
	            joinedOrder.setUsedDeposit(rsOrder.getInt("used_deposit"));
	            joinedOrder.setUsedPoints(rsOrder.getInt("used_points"));
	            joinedOrder.setOrderDate(rsOrder.getTimestamp("order_date"));
	            joinedOrder.setDeliveryStatus(rsOrder.getString("delivery_status"));
	            joinedOrder.setFinalPrice(rsOrder.getInt("final_price"));
	
	            // 2. 해당 order_id의 order_product에서 product_id 조회
	            String productIdsSQL = "SELECT product_id FROM order_product WHERE order_id = ?";
	            pstmtProductIds = conn.prepareStatement(productIdsSQL);
	            pstmtProductIds.setInt(1, joinedOrder.getOrderId());
	            rsProductIds = pstmtProductIds.executeQuery();
	
	            List<ProductDetailBean> productList = new ArrayList<>();
	            while (rsProductIds.next()) {
	                int productId = rsProductIds.getInt("product_id");
	
	                // 3. product_id로 상품 상세 정보 조회
	                ProductDetailBean productDetail = pDAO.getProductDetail(productId);
	                if (productDetail != null) {
	                    productList.add(productDetail);
	                }
	            }
	            joinedOrder.setProductList(productList);
	
	            resultList.add(joinedOrder);
	
	            rsProductIds.close();
	            pstmtProductIds.close();
	        }
	
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rsOrder != null) rsOrder.close();
	            if (pstmtOrder != null) pstmtOrder.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	
	    return resultList;
	}
	
}

