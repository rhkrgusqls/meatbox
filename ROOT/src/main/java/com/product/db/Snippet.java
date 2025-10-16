package com.product.db;

import java.util.List;

public class Snippet {

    public static void main(String[] args) throws Exception {
        ProductDAO dao = new ProductDAO();

        // 🔍 "새로운상품이름" 포함된 상품 1페이지
        List<ProductBean> list1 = dao.searchProducts("새로운상품이름", 1);
        printResult("검색결과 - 새로운상품이름", list1);

        // 🔍 "돼지" 포함된 상품 2페이지
        List<ProductBean> list2 = dao.searchProducts("돼지", 2);
        printResult("검색결과 - 돼지", list2);

        // 🔍 전체 상품 1페이지 (keyword = null)
        List<ProductBean> listAll = dao.searchProducts(null, 1);
        printResult("검색결과 - 전체", listAll);
    }

    // 결과 리스트를 보기 좋게 출력하는 유틸 메서드
    private static void printResult(String title, List<ProductBean> list) {
        System.out.println("========== " + title + " ==========");
        if (list == null || list.isEmpty()) {
            System.out.println("검색 결과 없음");
            return;
        }

        for (ProductBean p : list) {
            System.out.printf(
                "[상품ID: %d] 이름: %s | 가격: %.2f | 브랜드: %s | 카테고리: %s | 세부카테고리: %s | 옵션가격: %.2f | 총가격: %.2f%n",
                p.getProductId(),
                p.getProductName(),
                p.getPrice(),
                p.getBrandName(),
                p.getCategoryName(),
                p.getDetailCategoryName()
            );
        }
        System.out.println();
    }
}
