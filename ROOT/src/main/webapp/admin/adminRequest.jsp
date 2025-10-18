<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 요청 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 테이블 스타일 */
table { width: 100%; border-collapse: collapse; }
th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
.option-box { margin-bottom: 4px; }
.img-scroll img { max-width: 50px; max-height: 50px; margin: 2px; }
.detail-box a { text-decoration: none; color: blue; }
</style>
</head>
<body>
<div class="admin-wrapper">
    <main class="main-content">
        <div class="content-box">
            <h2>상품 등록 요청 목록</h2>
            <table class="table" id="requestTable">
                <thead>
                    <tr>
                        <th>판매자 ID</th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>등록일</th>
                        <th>가격</th>
                        <th>옵션</th>
                        <th>이미지</th>
                        <th>상세자료</th>
                    </tr>
                </thead>
                <tbody id="requestBody">
                    <!-- JS로 데이터 채움 -->
                </tbody>
            </table>
        </div>
    </main>
</div>

<script>


function loadRequestList() {
    $.ajax({
        url: "requestList.do", // JSON 데이터를 반환하는 서버 API
        type: "GET",
        dataType: "json",
        success: function(response) {
            const tbody = $("#requestBody");
            tbody.empty();

            if (!response || response.length === 0) {
                tbody.append("<tr><td colspan='8'>등록된 요청이 없습니다.</td></tr>");
                return;
            }

            response.forEach(req => {
                // 옵션 처리
                const optionsHtml = req.productOptionsJson && req.productOptionsJson.length > 0
                    ? req.productOptionsJson.map(opt => `<div class='option-box'><strong>${opt.name}:</strong> ${opt.value}</div>`).join('')
                    : '-';

                // 이미지 처리
                const imagesHtml = req.productImagesJson && req.productImagesJson.length > 0
                    ? `<div class='img-scroll'>${req.productImagesJson.map(img => `<img src='${img.dir}' alt='상품 이미지'>`).join('')}</div>`
                    : '-';

                // 상세자료 처리
                const detailsHtml = req.productDetailsJson && req.productDetailsJson.length > 0
                    ? req.productDetailsJson.map(det => `<div class='detail-box'><a href='${det.dir}' target='_blank'>${det.dir}</a></div>`).join('')
                    : '-';

                // 행 추가
                const row = `
                    <tr>
                        <td>${req.userIndex}</td>
                        <td>${req.productName}</td>
                        <td>${req.categoryName} / ${req.detailCategoryName}</td>
                        <td>${req.receivedDate}</td>
                        <td>${req.price}원</td>
                        <td>${optionsHtml}</td>
                        <td>${imagesHtml}</td>
                        <td>${detailsHtml}</td>
                    </tr>
                `;
                tbody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.error("데이터 요청 실패:", error);
            alert("데이터를 불러오는 중 오류가 발생했습니다.");
        }
    });
}
</script>
</body>
</html>
