// com/admin/action/AdminProductUpdateAction.java

package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.db.ProductBean;
import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;
import java.util.Enumeration;


public class AdminProductUpdateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ActionForward forward = new ActionForward();

        if (request.getMethod().equalsIgnoreCase("GET")) {
            System.out.println("M: AdminProductUpdateAction - GET 방식 호출");

            int productId = Integer.parseInt(request.getParameter("productId"));

            ProductDAO dao = new ProductDAO();
            ProductDetailBean product = dao.getProductDetail(productId);

            // 현재 상품의 카테고리 ID 조회 및 상위 카테고리 계산 (프리셀렉트용)
            Integer currentCategoryId = dao.getProductCategoryId(productId);
            Integer currentParentId = null;
            if (currentCategoryId != null) {
                CategoryDAO cdao = new CategoryDAO();
                CategoryDTO cur = cdao.getCategoryById(currentCategoryId);
                if (cur != null) {
                    currentParentId = cur.getParentCategoryId();
                }
            }

            request.setAttribute("product", product);
            request.setAttribute("currentCategoryId", currentCategoryId);
            request.setAttribute("currentParentId", currentParentId);

            request.setAttribute("contentPage", "/admin/adminProductUpdate.jsp");
            forward.setPath("/admin/adminHome.jsp");
            forward.setRedirect(false);

        } else if (request.getMethod().equalsIgnoreCase("POST")) {
            System.out.println("M: AdminProductUpdateAction - POST 방식 호출");
            request.setCharacterEncoding("UTF-8");

            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            int price = Integer.parseInt(request.getParameter("price"));

            ProductBean product = new ProductBean();
            product.setProductId(productId);
            product.setProductName(productName);
            product.setPrice(price);

            ProductDAO dao = new ProductDAO();
            
            dao.updateProduct(product);

            // 카테고리 업데이트 (하위 카테고리 선택 값을 사용)
            String categoryIdStr = request.getParameter("categoryId");
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                try {
                    int categoryId = Integer.parseInt(categoryIdStr);
                    dao.updateProductCategory(productId, categoryId);
                } catch (NumberFormatException ignore) { }
            }

            Enumeration<String> params = request.getParameterNames();
            while (params.hasMoreElements()) {
                String paramName = params.nextElement();
                if (paramName.startsWith("quantity_")) {
                    int optionId = Integer.parseInt(paramName.substring(9));
                    int quantity = Integer.parseInt(request.getParameter(paramName));
                    int priceOfOption = Integer.parseInt(request.getParameter("price_of_option_" + optionId));
                    
                    dao.updateProductOption(optionId, quantity, priceOfOption);
                }
            }
            forward.setPath("/admin/AdminProductList.ac");
            forward.setRedirect(true);
        }

        return forward;
    }
}