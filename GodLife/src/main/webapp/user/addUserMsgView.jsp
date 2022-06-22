<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- CSS , JS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

<!-- CSS-->
<link rel="stylesheet" href="/css/getUser.css" />


<style>

	body {
           padding-top : 50px;
       }
       
      #getUser{
       padding-top : 130px;
       }
       
       
       .id_ok{
	color:#064ACB;
	display: none;
	font-size : 14px;
	}
	
	.id_already{
	color:#064ACB; 
	display: none;
	font-size : 14px;
	}
	
	.id_ok2{
	color:#064ACB;
	display: none;
	font-size : 14px;
	}
	.id_already2{
	color:#064ACB; 
	display: none;
	font-size : 14px;
	}
	
	.doubleChk{
	color:#064ACB;
	font-size : 14px;
	
	}
	
 </style>

<style>

img
{
border : 5px solid white;
width : 200px;
height : 200px;
float : center;
}

</style>


<script src="javascript/data.js"></script>
<!--  자바스크립트 -->
<script type="text/javascript">

var checkEmail = 0;


		   //==>"받는사람 이메일" 있는지 없는지 검사 
		
		function checkUserEmail(){
	        var userEmail = $('#recvEmail').val(); //id값이 "id"인 입력란의 값을 저장
	        
	        $.ajax({
	        	 url: '/user/json/checkUserEmail', //Controller에서 요청 받을 주소
	            type:'post', //POST 방식으로 전달
	            data:{userEmail:userEmail},
	       
	            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 디비에 없으니까 보낼수없는 이메일  
	                    $('.id_ok').css("display","inline-block"); 
	                    $('.id_already').css("display", "none");
	                    checkEmail =1;
	                    //alert("해당 이메일은 존재하지 않습니다.");
	                } else { // cnt가 1일 경우 -> 이미 존재하는 이메일이니까 보낼수있음
	                    $('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none");
	                    //alert("이메일을 다시 입력해주세요");
	                    checkEmail = 0;
	                }
	            },
	            error:function(){
	                alert("에러입니다");
	            }
	        });
	        };
	        
	        //===========이메일 오토컴플릿 구현====================
	        	
	        	$(function () {	//화면 로딩후 시작
	        		var searchSource = ["admin@io.com", "chilee4650@naver.com", "kimhoyam@hotmail.com", "lllll@naver.ocm", "lovejuf@naver.com",
	        										"tndkdml@gmail.com","user01@io.com","user02@io.com","user03@io.com","user04@io.com","user05@io.com" ]; // 배열 형태로 

	        			$("#recvEmail").autocomplete({  //오토 컴플릿트 시작
				source: searchSource,	// source는 data.js파일 내부의 List 배열 > 일단 이거 보류.. 먹히지않음.. 
				focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
				},
				minLength: 1,// 최소 글자수
				delay: 100,	//autocomplete 딜레이 시간(ms)
				//disabled: true, //자동완성 기능 끄기
			});
		});
	        
	        
		
			//============= "쪽지보내기"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#writeBtn" ).on("click" , function() {
				fncAddUserMsg();
			});
		});	
			
		
		function fncAddUserMsg() {
			
			var recvEmail=$("input[name='recvEmail']").val();
			var name=$("input[name='title']").val();
			//var ok= $.trim($('.id_ok').text());
			//console.log("이거제발나와...."+ok);
			//alert("이거나오니...."+ok);
			
			
			if(checkEmail != 0){
				alert("이메일을 다시 확인해주세요");
				return;
			}
			
			if(recvEmail == null || recvEmail.length <1){
				alert("이메일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("제목은  반드시 입력하셔야 합니다.");
				return;
			}
			
			/*
			if(ok == '해당 이메일은 존재하지 않습니다.'){
				alert("이메일을 다시 확인해주세요");
				return;
			}
			*/
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUserMsg").submit();
		}
		
		
		//============= "내용 글자수 검사" =============
			
		$(document).ready(function() {
	    $('#detail').on('keyup', function() {
	        $('#test_cnt').html("("+$(this).val().length+" / 1000)");
	 
	        if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('#test_cnt').html("(1000 / 1000)");
	        }
	    });
	});
		
		//============= "제목 글자 수 검사" =============
		
		$(document).ready(function() {
	    $('#title').on('keyup', function() {
	        $('#test_cnt1').html("("+$(this).val().length+" / 50)");
	 
	        if($(this).val().length > 50) {
	            $(this).val($(this).val().substring(0, 50));
	            $('#test_cnt1').html("(50 / 50)");
	        }
	    });
	});
	</script>
	
<title>쪽지 보내기</title>
</head>
<body>

<!-- 왼쪽 레이아웃 삽입-->
	<jsp:include page="/user/mypageMain.jsp" />

	<div class="page_aticle">
		<div class="type_form getUser" id="getUser">
			<form id="form" name="frmMember" >
			
				<div class="field_head">
					<h3 class="tit">쪽지 보내기</h3>
				</div>
				
				<table class="tbl_comm">
				
				<tr class="fst">
						<th>이메일</th>
						<td>
							<input type="text" class="form-control" id="recvEmail" name="recvEmail" placeholder="이메일" oninput = "checkUserEmail()" >
							<span id="helpBlock" class="id_ok">해당 이메일은 존재하지 않습니다.</span>
			 				 <span id="helpBlock" class="id_already"></span>
						</td>
					</tr>
				
					<tr>
						<th>제목</th>
						<td>
						      <input type="text" class="form-control" id="title" name="title"  style="width :455px; height : 45px;">
						      <div id="test_cnt1" style ="font-size : 13px">(0 / 50)</div>
						  </td>
					</tr>
					
					<tr class="detail">
						<th>내용</th>
						<td>
								<textarea id = "detail" name="detail" cols="50" rows="20"  style="width :455px; height : 327px;"></textarea>
								<div id="test_cnt" style ="font-size : 13px">(0 / 1000)</div>
						</td>
					</tr>
					
					</table>
	
				<div id="formSubmit" class="form_footer">
					<div id="checkDiv" class="checkDiv"></div>
					<button type="button"  class="btn active btn_join" id="writeBtn">전송</button>
				</div>
			</form>
		</div>
		
			  	
		
		
		
		
	</div>
</body>
</html>