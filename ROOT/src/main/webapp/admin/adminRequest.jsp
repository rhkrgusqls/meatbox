<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 요청 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body { font-family: 'Malgun Gothic', sans-serif; background:#f4f7f6; color:#333; }
table { width:100%; border-collapse: collapse; margin-top:20px; }
th, td { padding:8px 12px; border-bottom:1px solid #ccc; }
th { background:#f9f9f9; font-weight:bold; }
.slide-container { display:flex; overflow-x:auto; gap:10px; padding:5px 0; }
.slide-container img { height:80px; border-radius:4px; }
.option-row { white-space: pre-line; font-size:13px; }
button.approveBtn { background:#4CAF50; color:#fff; border:none; padding:5px 10px; border-radius:4px; cursor:pointer; }
button.approveBtn:hover { background:#45a049; }
</style>
</head>
<body>

<h1></h1>
<table id="productTable">
    <tbody></tbody>
</table>

<script>
$(document).ready(function(){

    function loadProducts(){
        $.ajax({
            url: '/requestList.do',
            method: 'GET',
            dataType: 'json',
            success: function(data){
                var tbody = $('#productTable tbody');
                tbody.empty();

                data.forEach(function(product){
                    // 1줄: 버튼에 requestId 직접 data-attribute로 담기
                    tbody.append('<tr><td colspan="6">' +
                                 ' 상품명: '+product.productName+
                                 ' | 카테고리: '+product.categoryName+
                                 ' | 등록일: '+product.receivedDate+
                                 ' | 가격: '+product.price+'원'+
                                 ' <button class="approveBtn" data-requestid="'+product.requestId+'">승인</button>' +
                                 '</td></tr>');

                    // 2줄: 옵션
                    var optStr = '';
                    if(product.productOptionsJson && product.productOptionsJson.length > 0){
                        product.productOptionsJson.forEach(function(opt){
                            optStr += '옵션ID: '+(opt.optionId||'')+
                                      ', 이름: '+(opt.optionName||opt.option_name||'')+
                                      ', 상세: '+(opt.optionDetail||opt.option_detail||'')+
                                      ', 가격: '+(opt.priceOfOption||0)+
                                      ', 수량: '+(opt.quantity||0)+'\n';
                        });
                    } else {
                        optStr = '옵션 없음';
                    }
                    tbody.append('<tr><td colspan="6" class="option-row">'+optStr+'</td></tr>');

                    // 3줄: 이미지
                    var imgHtml = '<div class="slide-container">';
                    if(product.productImagesJson && product.productImagesJson.length > 0){
                        product.productImagesJson.forEach(function(img){
                            imgHtml += '<img src="'+img.dir+'" alt="상품 이미지">';
                        });
                    }
                    imgHtml += '</div>';
                    tbody.append('<tr><td colspan="6">'+imgHtml+'</td></tr>');

                    // 4줄: 상세 이미지
                    var detailHtml = '<div class="slide-container">';
                    if(product.productDetailsJson && product.productDetailsJson.length > 0){
                        product.productDetailsJson.forEach(function(img){
                            detailHtml += '<img src="'+img.dir+'" alt="상세 이미지">';
                        });
                    }
                    detailHtml += '</div>';
                    tbody.append('<tr><td colspan="6">'+detailHtml+'</td></tr>');
                });
            },
            error: function(err){
                alert('데이터 로딩 실패');
                console.error(err);
            }
        });
    }

    loadProducts(); // 초기 로딩

    // 승인 버튼 클릭 처리
    $(document).on('click', '.approveBtn', function(){
        var requestId = $(this).data('requestid'); // data-attribute에서 직접 가져오기
        if(!requestId) return alert('requestId가 없습니다.');
        if(!confirm("정말 승인하시겠습니까?")) return;

        $.ajax({
            url: '/approveProductRequest.do',
            method: 'POST',
            data: { requestId: requestId },
            success: function(res){
                alert('✅ 승인 완료');
                loadProducts(); // 승인 후 테이블 새로고침
            },
            error: function(err){
                alert('⚠️ 승인 중 오류 발생');
                console.error(err);
            }
        });
    });

});
</script>

</body>
</html>



