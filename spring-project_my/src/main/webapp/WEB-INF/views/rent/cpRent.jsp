<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>캠핑장 검색</title>
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
	
		<section class="cp_Rent">
			<h1 style="color:red;">※ 안내사항 ※</h1><br>
			<div><img src="../assets/img/rent/cpRent0.png"></div>
		
			<!-- 모달 창 -->
			<div id="myModal" class="modal">
			  <div class="modal-content">
			    <span class="close" onclick="closeModal()">&times;</span>
			    <img id="modalImage" src="" alt="이미지">
			  </div>
			</div>
			
			<script>
			// 모달 창을 표시하는 함수
			function showModal(imageSrc) {
			  var modal = document.getElementById("myModal");
			  var modalImage = document.getElementById("modalImage");
			  modalImage.src = imageSrc;
			  modal.style.display = "block";
			}
			
			// 모달 창을 닫는 함수
			function closeModal() {
			  var modal = document.getElementById("myModal");
			  modal.style.display = "none";
			  document.body.style.backgroundColor = "transparent"; // 배경을 투명하게 만듦
			}
			
			// 모달 창 외부를 클릭했을 때 모달 창 닫기
			window.onclick = function(event) {
			  var modal = document.getElementById("myModal");
			  if (event.target == modal) {
			    modal.style.display = "none";
			  }
			}
			
			</script>
		   
			<!-- 캠핑용품대여 -->
		    	<h1>캠핑용품 대여</h1>
		   <!-- 카드형 패키지 -->
		    <div class="packList">
		    <h3>패키지 상품</h3>
            <ul>
                <li class="item item1">
                    <div class="image">사진</div>
                    <div class="cont">
                        <strong>2인 패키지</strong>
                        <p>텐트, 의자, 테이블, 코펠, 랜턴, 발포매트, 버너, 그라운드시트, 가렌더</p>
                        <p>55,000</p>
                        <a href="cpRent_v1">상세보기</a>
                    </div>
                </li>
                <li class="item item2">
                    <div class="image">사진</div>
                    <div class="cont">
                        <strong>3인 패키지</strong>
                        <p>텐트, 의자, 타프, 테이블, 코펠, 랜턴2, 발포매트, 버너, 그라운드시트, 가렌더</p>
                        <p>65,000</p>
                        <a href="cpRent_v2">상세보기</a>
                    </div>
                </li>
                <li class="item item3">
                    <div class="image">사진</div>
                    <div class="cont">
                        <strong>4인 패키지</strong>
                        <p>텐트, 의자, 타프, 테이블, 코펠, 랜턴2, 화로대, 발포매트, 버너, 그라운드시트, 가렌더 ···</p>
                        <p>105,000</p>
                        
                        <a href="cpRent_v3">상세보기</a>
                    </div>
                </li>
            </ul>
        </div>
        <script type="text/javascript">
	    $(document).on("click", ".cp_CartBtn", function() {
	        // 로그인을 해야만 다음으로 진행가능하게 구현
	        let session_id = "${session_id}";
	        if (session_id === null || session_id === "") {
	            alert("로그인을 하여야 다음으로 진행할 수 있습니다. 로그인 해주세요!");
	            return false;
	        }
	        
	        // 체크박스의 체크가 하나라도 선택 되어야 넘어가게 구현
	        let checkboxes = document.querySelectorAll('input[name="pro_id"]:checked');
	        if (checkboxes.length === 0) {
	            alert("체크박스를 하나 이상 선택해주세요!");
	            return false;
	        }
	     
	        // 두개의 조건이 맞으면 넘어감!
	        cp_CartFrm.submit();
	        
	     // 선택된 체크박스 체크 해제
	        checkboxes.forEach(function (checkbox) {
	            checkbox.checked = false;
	        });

	    });
		</script>
        <!-- 체크박스 -->
        <form action="doCp_Cart" method="post" id="cp_CartFrm" name="cp_CartFrm">
		  <div class="cp_check">
		  		<h3>패키지 선택</h3>
		  		<dl class="pack">
			 	<dt>캠핑 패키지 선택</dt><br><br>
				 <ul>
					 <li>
						 <input type="checkbox" id="package1" name="pro_id" value="p001" onClick="clkOftenAddr(this);"/> 
						 <label for="package1">2인용 패키지</label> 
					 </li>
			 		<li> 
				 		<input type="checkbox" id="package2" name="pro_id" value="p002" onClick="clkOftenAddr(this);"/> 
				 		<label for="package2">3인용 패키지</label> 
			 		</li>
					<li> 
						<input type="checkbox" id="package3" name="pro_id" value="p003" onClick="clkOftenAddr(this);"/> 
						<label for="package3">4인용 패키지</label> 
					</li>
		 		</ul></dl>
		 		
		 		<h3>용품 선택 사항</h3>
		 		<p class="explanation" style="color:red;">※ 선택시 체크박스 선택해주세요 / 상품명(가격)에 마우스를 올리면 사진이 나옵니다. 빈곳을 누르면 창이 사라집니다.※</p>
		  		<dl class="pack">
			 	<dt class="Main_Category">침구 선택</dt>
				<ul>
				    <li>
				        <input type="checkbox" id="bedding1" name="pro_id" value="p004" onClick="clkOftenAddr(this);"/> 
				        <label for="bedding1" onmouseover="showModal('../assets/img/rent/sleepingbag.PNG');">침낭(6,000원)</label> 
				    </li>
				    <li> 
				        <input type="checkbox" id="bedding2" name="pro_id" value="p005" onClick="clkOftenAddr(this);"/> 
				        <label for="bedding2" onmouseover="showModal('../assets/img/rent/mat.PNG');">발포매트(3,000원)</label> 
				    </li>
				    <li> 
				        <input type="checkbox" id="bedding3" name="pro_id" value="p006" onClick="clkOftenAddr(this);"/> 
				        <label for="bedding3" onmouseover="showModal('../assets/img/rent/blanket.PNG');">전기장판(7,000원)</label> 
				    </li>
				    <li> 
				        <input type="checkbox" id="bedding4" name="pro_id" value="p007" onClick="clkOftenAddr(this);;"/> 
				        <label for="bedding4" onmouseover="showModal('../assets/img/rent/pillow.PNG');">베개(2,000원)</label> 
				    </li>
				</ul>
			 	<br><dt class="Main_Category">가구 선택 </dt>
				 <ul>
					 <li>
						 <input type="checkbox" id="furniture1" name="pro_id" value="p008" onClick="clkOftenAddr(this);"/> 
						 <label for="furniture1" onmouseover="showModal('../assets/img/rent/chair.PNG');">의자(7,000원)</label> 
					 </li>
			 		<li> 
				 		<input type="checkbox" id="furniture2" name="pro_id" value="p009" onClick="clkOftenAddr(this);"/> 
						 <label for="furniture2" onmouseover="showModal('../assets/img/rent/table.PNG');">의자테이블(9,000원)</label> 
			 		</li>
					<li> 
						<input type="checkbox" id="furniture3" name="pro_id" value="p010" onClick="clkOftenAddr(this);"/> 
						 <label for="furniture3" onmouseover="showModal('../assets/img/rent/fieldbed.PNG');">야전침대(11,000원)</label> 
					</li>
					
		 		</ul>
			 	<br><dt class="Main_Category">식기 선택 </dt>
				 <ul>
					 <li>
						 <input type="checkbox" id="tableware1" name="pro_id" value="p011" onClick="clkOftenAddr(this);"/> 
						 <label for="tableware1" onmouseover="showModal('../assets/img/rent/coppell2.PNG');">코펠 2인(5,000원)</label>
					 </li>
			 		<li> 
				 		<input type="checkbox" id="tableware2" name="pro_id" value="p012" onClick="clkOftenAddr(this);"/> 
						<label for="tableware2" onmouseover="showModal('../assets/img/rent/coppell4.PNG');">코펠 3인(6,000원)</label>
			 		</li>
					<li> 
						<input type="checkbox" id="tableware3" name="pro_id" value="p013" onClick="clkOftenAddr(this);"/> 
						<label for="tableware3" onmouseover="showModal('../assets/img/rent/iecboxsmall.PNG');">아이스박스 28L(6,000원)</label>
					</li>
					<li> 
						<input type="checkbox" id="tableware4" name="pro_id" value="p014" onClick="clkOftenAddr(this);"/> 
						<label for="tableware4" onmouseover="showModal('../assets/img/rent/iecboxbig.PNG');">아이스박스 40L(9,000원)</label>
					</li>
					
		 		</ul>
			 	<br><dt class="Main_Category">기타 선택 </dt>
				 <ul>
					 <li>
						 <input type="checkbox" id="etc1" name="pro_id" value="p015" onClick="clkOftenAddr(this);"/> 
						<label for="etc1" onmouseover="showModal('../assets/img/rent/tarp.PNG');">타프(15,000원)</label>
					 </li>
			 		<li> 
				 		<input type="checkbox" id="etc2" name="pro_id" value="p016" onClick="clkOftenAddr(this);"/> 
						<label for="etc2" onmouseover="showModal('../assets/img/rent/burner.PNG');">버너(6,000원)</label>
			 		</li>
					<li> 
						<input type="checkbox" id="etc3" name="pro_id" value="p017" onClick="clkOftenAddr(this);"/> 
						<label for="etc3" onmouseover="showModal('../assets/img/rent/lantern.PNG');">랜턴(5,000원)</label>
					</li>
					<li> 
						<input type="checkbox" id="etc4" name="pro_id" value="p018" onClick="clkOftenAddr(this);"/> 
						<label for="etc4" onmouseover="showModal('../assets/img/rent/brazier.PNG');">화로대(14,000원)</label>
					</li>
					<li> 
						<input type="checkbox" id="etc5" name="pro_id" value="p019" onClick="clkOftenAddr(this);"/> 
						<label for="etc5" onmouseover="showModal('../assets/img/rent/electricwire.PNG');">전기릴선(6,000원)</label>
					</li>
					
		 		</ul>
		 		
		 		</dl>
		  </div>
        </form>
		  
		  <a href="/"><button type="button" class="cp_CartBtn">메인으로</button></a> 
		  <button type="button" class="cp_CartBtn">선택품목 담기</button>
        
        
		
		  </section>
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>