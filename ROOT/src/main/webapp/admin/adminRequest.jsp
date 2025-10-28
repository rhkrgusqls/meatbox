<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.slide-container { display:flex; overflow-x:auto; gap:10px; padding:5px 0; }
.slide-container img { height:80px; border-radius:4px; }
.option-row { white-space: pre-line; font-size:13px; }
.btn-approve { background-color:#2ecc71; color:#fff; border:none; padding:6px 10px; border-radius:4px; cursor:pointer; font-weight:bold; }
.btn-approve:hover { background-color:#27ae60; }
</style>

<main class="main-content">
    <div class="page-header">
        <h1>상품등록 요청 관리</h1>
    </div>
    <div class="content-box">
        <table class="order-table" id="productTable">
            <tbody></tbody>
        </table>
    </div>
</main>

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
                    tbody.append('<tr><td colspan="6">' +
                                 '<strong>상품명:</strong> '+product.productName+
                                 ' &nbsp;|&nbsp; <strong>카테고리:</strong> '+product.categoryName+
                                 ' &nbsp;|&nbsp; <strong>등록일:</strong> '+product.receivedDate+
                                 ' &nbsp;|&nbsp; <strong>가격:</strong> '+product.price+'원'+
                                 ' &nbsp; <button class="btn-approve" data-requestid="'+product.requestId+'">승인</button>' +
                                 '</td></tr>');

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

                    var imgHtml = '<div class="slide-container">';
                    if(product.productImagesJson && product.productImagesJson.length > 0){
                        product.productImagesJson.forEach(function(img){
                            imgHtml += '<img src="'+img.dir+'" alt="상품 이미지">';
                        });
                    }
                    imgHtml += '</div>';
                    tbody.append('<tr><td colspan="6">'+imgHtml+'</td></tr>');

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

    loadProducts();

    $(document).on('click', '.btn-approve', function(){
        var requestId = $(this).data('requestid');
        if(!requestId) return alert('requestId가 없습니다.');
        if(!confirm("정말 승인하시겠습니까?")) return;

        $.ajax({
            url: '/approveProductRequest.do',
            method: 'POST',
            data: { requestId: requestId },
            success: function(){
                alert('✅ 승인 완료');
                loadProducts();
            },
            error: function(err){
                alert('⚠️ 승인 중 오류 발생');
                console.error(err);
            }
        });
    });
});
</script>
