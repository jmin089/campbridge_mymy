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
		<div class="orderDivNm">
			<table id="cartTable" summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
			    <!--<caption id="cp_cart_list">대여 상품목록</caption> -->
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
		let stat = "";
        
        // 수량을 감소시키는 함수
        function countBtnDown() {
            let current_count = $(this).siblings(".current_count");
            let count = parseInt(current_count.val());
            if (count > 1) {
                current_count.val(count - 1);
                updateTotalPrice($(this));
                stat = "countDown";
                updateQuantityOnServer($(this),stat);
            }
        }

        // 수량을 증가시키는 함수
        function countBtnUp() {
            let current_count = $(this).siblings(".current_count");
            let count = parseInt(current_count.val());
            current_count.val(count + 1);
            updateTotalPrice($(this));
            stat = "countUp";
            updateQuantityOnServer($(this),stat);
        }

        // 합계금액을 업데이트하는 함수
        function updateTotalPrice(countBtn) {
            let parentRow = countBtn.closest("tbody");
            let unitPriceText = parentRow.find('.tnone').text().replace(' 원', '').replace(',', '');
            let unitPrice = parseFloat(unitPriceText);
            let quantity = parseInt(parentRow.find('.current_count').val());
            let totalPrice = unitPrice * quantity;
            parentRow.find('.total_tnone').text(totalPrice.toLocaleString() + ' 원');
        }

        // 서버에 수량 업데이트 함수
        function updateQuantityOnServer(countBtn,stat) {
            let parentRow = countBtn.closest("tbody");            
            let cart_id = parentRow.find('.cart_id').val();
            //let pro_id = parentRow.find('.pro_id').val(); // 상품 ID 추가
            let current_count = parseInt(parentRow.find('.current_count').val());
			//alert(cart_id)
			//alert(pro_id)
			//alert(current_count)
            // AJAX를 사용하여 서버에 업데이트된 수량 전송
            $.ajax({
                url: "/rent/updatecount",
                type: "post",
                data: {"cart_id": cart_id, "cart_count": current_count, "stat":stat},
                dataType: "text",
                success: function(result) {
                    alert("성공");
                   /*  location.href = "/rent/cp_Cart"; */
                },
                error: function() {
                    alert("실패");
                }
            }); //ajax 끝
        }
    });
</script>

			    <tbody>
			        <c:forEach var="product_rentcartDto" items="${list}">
			        <c:if test="${product_rentcartDto.cartDto.id eq sessionScope.session_id}">
			        <input type="hidden" name="cart_id" class="cart_id" value="${product_rentcartDto.cartDto.cart_id}"/>
			        <input type="hidden" name="cart_count" class="cart_count" value="${product_rentcartDto.cartDto.cart_count}"/>
			        <input type="hidden" name="pro_id" class="pro_id" value="${product_rentcartDto.proDto.pro_id}"/>
			            <tr>
			                <td class="checkboxbox">
			                <input class="chbox" type="checkbox" data-cart_id="${product_rentcartDto.cartDto.cart_id}" checked="checked"/></td>

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
			                    <input type="button" class="countBtnDown" onclick="updateQuantity(-1)">
			                    <input class="current_count" id="quantityField_${product_rentcartDto.cartDto.cart_id}" value="${product_rentcartDto.cartDto.cart_count}" maxlength="3"/>
			                    <input type="button" class="countBtnUp" onclick="updateQuantity(+1)">
			                </td>
   							<td class="total_tnone">
							    <fmt:formatNumber value="${product_rentcartDto.proDto.p_price * product_rentcartDto.cartDto.cart_count}" pattern="#,##0"/> 원
							</td>
   							<td class="tnone">
							    <ul class="order">    
							       <div class="delete">
									    <button type="button" class="delete_btn ${product_rentcartDto.cartDto.cart_id}" data-cart_id="${product_rentcartDto.cartDto.cart_id}">상품삭제</button>
									</div>
									<script>
									    $(".${product_rentcartDto.cartDto.cart_id}").click(function(){
									        let confirm_val = confirm("정말 삭제하시겠습니까?");
									        
									        if(confirm_val) {
									            let cart_id = $(this).attr("data-cart_id");
									            //alert(cart_id)
									            $.ajax({
									                url: "/rent/deleteOneCart",
									                type: "post",
									                data: { "cart_id": cart_id },
									                success: function(result) {
									                    alert("성공");
									                        location.href = "/rent/cp_Cart";
									                },
									                error: function() {
									                    alert("실패");
									                }
									            }); //ajax 끝.
									        } //if
									    });
									</script>
							    </ul>
							</td>
   							
			            </tr>
			        </c:if>
			        </c:forEach>
			    </tbody>
				</table>
			</div>
			
			<div class="c_btnArea">
				<div class="bRight">
					<ul>
						<li>
						 <div class="allCheck">
					    <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
						</div>
						<div class="delBtn">
						    <button type="button" class="selectDelete_btn ${product_rentcartDto.cartDto.cart_id}">선택 삭제</button> 
						</div>
					
						<script>
						
						$(document).ready(function() {
					        $("#allCheck").change(function() {
					            $(".chbox").prop("checked", $(this).prop("checked"));
					        });
					    });
						
						$(".selectDelete_btn").click(function(){
					        let confirm_val = confirm("선택된 물품을 정말 삭제하시겠습니까?");
					        
					        
					        if(confirm_val) {
					        	let checkArr = [];
					        	$("input[class='chbox']:checked").each(function(){
				                    checkArr.push($(this).attr("data-cart_id"));
				                });
					        	alert(checkArr)
					            $.ajax({
				                    url : "/rent/deleteCart",
				                    type : "post",
				                    data : {cart_id : checkArr},
				                    success : function(result){
				                        if(result == 1) {  
				                            alert("삭제 성공");
				                            location.href = "/rent/cp_Cart";
				                        }
					                },
					                error: function() {
					                    alert("실패");
					                }
					            }); //ajax 끝.
					        } //if
					    });
						</script>
						</li>
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
		
		 
	<a href="cpRent"><button type="button" class="cp_CartBtn">뒤로가기</button></a> 
	<a href="cp_Cart02"><button type="button" class="cp_CartBtn">선택상품 주문하기</button></a> 
	<a href="cp_Cart02"><button type="button" class="cp_CartBtn">전체상품 주문하기</button></a> 
      
	</section>
        
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>