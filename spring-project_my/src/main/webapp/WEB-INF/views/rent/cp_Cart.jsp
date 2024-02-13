<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대여 목록</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <meta content="" name="description">
	    <meta content="" name="keywords">
	
	    <!-- Favicons -->
	    <link href="assets/img/favicon.png" rel="icon">
	    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	    <!-- Google Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
	
	    <!-- Vendor CSS Files -->
	    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
	    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	    <!-- Template Main CSS File -->
	    <link href="../assets/css/main2.css" rel="stylesheet">
	    <link href="../assets/css/header.css" rel="stylesheet">
		<link href="../assets/css/rent/rentcart.css" rel="stylesheet">
	    
	    
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
	<section class="cp_cart">
		<!-- 장바구니에 상품이 있을경우 -->
		<!-- 장바구니 상품 -->
		<h1>장바구니</h1>
		<h3>장바구니에 담긴 상품은 30일간 보관됩니다.</h3>
		<div class="orderDivNm">
			<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
			    <caption id="cp_cart_list">대여 상품목록</caption>
			    <colgroup>
			        <col width="7%"/>
			        <col width="9%" class="tp" />
			        <col width="18%" class="tp"/>
			        <col width="12%" class="tnone" />
			        <col width="10%" class="tw14"/>
			        <col width="12%" class="tw28"/>
			        <col width="12%" class="tnone" />
			    </colgroup>
			    <thead class="rent_list">
			        <th scope="col"></th>
			        <th scope="col" colspan="2" class="tp">상품명</th>
			        <th scope="col" class="tnone">가격</th>
			        <th scope="col" class="tw14">수량</th>
			        <th scope="col">합계</th>
			        <th scope="col" class="tnone">주문</th>
			    </thead>
				    
			<script>
			    $(document).ready(function() {
			        $(".countBtnDown").on('click', countBtnDown);
			        $(".countBtnUp").on('click', countBtnUp);
			        
			        // 수량을 감소시키는 함수
			        function countBtnDown() {
			            let spinner = $(this).siblings(".spinner");
			            let count = parseInt(spinner.val());
			            if (count > 1) { // 최소 수량은 1로 설정
			                spinner.val(count - 1);
			                updateTotalPrice($(this));
			            }
			        }
			
			        // 수량을 증가시키는 함수
			        function countBtnUp() {
			            let spinner = $(this).siblings(".spinner");
			            let count = parseInt(spinner.val());
			            spinner.val(count + 1);
			            updateTotalPrice($(this));
			        }
			
			        // 합계금액을 업데이트하는 함수
			        function updateTotalPrice(btn) {
					    let parentRow = btn.closest("tr");
					    let unitPriceText = parentRow.find('.tnone').text().replace(' 원', '').replace(',', ''); // 쉼표를 제거한 후 숫자로 변환
					    let unitPrice = parseFloat(unitPriceText);
					    let quantity = parseInt(parentRow.find('.spinner').val());
					    let totalPrice = unitPrice * quantity;
					    parentRow.find('.total_tnone').text(totalPrice.toLocaleString() + ' 원'); // 수정된 위치에 업데이트합니다.
					}
			    });
			</script>
				    
			    <tbody>
			        <c:forEach var="product_rentcartDto" items="${list}">
			            <tr>
			                <td><input class="checkboxbox" type="checkbox" /></td>
			                <td><p class="img"><img src="/upload/${product_rentcartDto.proDto.p_file}" alt="상품" width="66" height="66" /></p></td>
			                <td>
			                    <ul class="goods">
			                        <li>
			                            <a href="#">${product_rentcartDto.proDto.p_name}</a>
			                        </li>
			                    </ul>
			                </td>
			                <td class="tnone">
   					 			<fmt:formatNumber value="${product_rentcartDto.proDto.p_price}" pattern="#,##0"/> 원<br/>
							</td>
   							<td class="countBtn">
   								<button type="button" class="countBtnDown"></button>
   								<input class="spinner" value="${product_rentcartDto.cartDto.cart_count}" maxlength="3"/>
   								<button type="button" class="countBtnUp"></button>
   							</td>
   							<td class="total_tnone">
							    <fmt:formatNumber value="${product_rentcartDto.proDto.p_price * product_rentcartDto.cartDto.cart_count}" pattern="#,##0"/> 원
							</td>
   							<td class="tnone">
			                    <ul class="order">    
			                        <li><a href="#" class="obtnMini iw70">바로구매</a></li>
			                        <li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
			                    </ul>
			                </td>
			            </tr>
			        </c:forEach>
			    </tbody>
				</table>
			</div>
			
			<script type="text/javascript">
			$(function(){
				 $(document).on("click",".selectbtn2",function(){
					// 선택된 품목들의 cart_id를 담을 배열
					 let check_id = [];
					
					 // 체크된 체크박스 항목을 확인하여 배열에 저장
					 $("input[type='checkbox']:checked").each(function(){
						 let cart_id = $(this).closest('tr').find('.checkboxbox').text(); // 상품 ID 가져오기
						 alert(cart_id);
						 check_id.push(cart_id !== '' ? parseInt(cart_id) : 0); // null 대신 0을 전달
					 });

					 /*
			        // 선택된 항목이 없는 경우 경고 메시지 출력 후 종료
			        if(check_id.length === 0){
			            alert("선택된 품목이 없습니다.");
			            return;
			        }

			        // 삭제를 확인하는 메시지 출력 후 확인 시 삭제 진행
			        if(confirm("선택된 품목을 삭제하시겠습니까?")){
			            // AJAX를 사용하여 선택된 품목을 서버로 전송하여 삭제 요청
			            $.ajax({
			                url: "/rent/cart_delete", // 삭제를 처리할 서버의 URL
			                type: "post",
			                data: {"check_id": check_id}, // 선택된 품목들을 서버로 전송
			                dataType: "text",
			                success: function(data){
			                    // 삭제가 성공한 경우
			                    alert("선택된 품목이 삭제되었습니다.");
			                    console.log(data);

			                    // 화면에서 선택된 품목들을 제거
			                    check_id.forEach(function(cart_id){
			                        $("#" + cart_id).remove(); // 해당 상품 행 제거
			                    });
			                },
			                error: function(){
			                    // 삭제 실패 시 오류 메시지 출력
			                    alert("품목 삭제에 실패했습니다.");
			                }
			            });
			        }
			        */
			    });
			})
			</script>
			
			<div class="c_btnArea">
				<div class="bRight">
					<ul>
						<li><a href="#" class="selectbtn">전체선택</a></li>
						<li><a href="#" class="selectbtn2">선택삭제</a></li>
					</ul>
				</div>
			</div>
			<!-- //장바구니 상품 -->
			<!-- 총 주문금액 -->
			<div class="amount">
				<br><h4>총 주문금액</h4>
				<ul class="info">
					<li>
						<span class="title">상품 합계금액</span>
						<span class="won"><strong>63,000</strong> 원</span>
					</li>
				</ul>
				<ul class="total">
					
					<li class="txt"><strong>결제 예정 금액</strong></li>
					<li class="money"><span>68,000</span> 원</li>
				</ul>
			</div>
			<!-- //총 주문금액 -->

		<!-- //장바구니에 상품이 있을경우 -->
		
		<!-- 장바구니에 상품이 없을경우
			<div class="noting">
				<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

				<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

				<a href="#">쇼핑 계속하기</a>
			</div>
		 //장바구니에 상품이 없을경우 -->
		 
	<a href="cpRent"><button type="button" class="cp_CartBtn">뒤로가기</button></a> 
	<a href="cp_Cart02"><button type="button" class="cp_CartBtn">선택상품 주문하기</button></a> 
	<a href="cp_Cart02"><button type="button" class="cp_CartBtn">전체상품 주문하기</button></a> 
      
	</section>
        
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>