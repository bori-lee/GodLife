<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" 
integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" 
integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" 
integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" 
crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link href="/resources/css/listCertiImg.css" rel="stylesheet">

<script type="text/javascript">
		$(document).ready(function () {
			  $(document).scroll(function() {
			    var maxHeight = $(document).height();
			    var currentScroll = $(window).scrollTop() + $(window).height();
				
				
			    if (maxHeight <= currentScroll + 100) {
			    	var page = Number($("input[name='page']").val())+1;
			    	dis="<input type=\"hidden\" name=\"page\" value=\""+page+"\">";
			      $("#pages").remove();
			      $("#flat").html(dis);
			      
			      	$.ajax({
			      		url:"/challenge/challengeRest/getChallengeCertiImgList?pageNo="+page,
			      		method:"GET",
			      		dateType:"json",
			      		headers:{
			      			"Accept":"application/json",
			      			"content-Type":"application/json"
			      		},
			      		success:function(JSONData){
				      			$(JSONData).each(function(){
				      				console.log(this.certiImg);
				      				var displayView = "<div class=\"thumbnail\">"+
				      				"<img style=\"width:700px; height:700px; position:relative; top:30px;\" src=\"/resources/images/uploadFiles/"+this.certiImg+
				      				"\" onerror=\"this.src='https://dummyimage.com/700x700/1af0d4/000000.gif'\">"+
				      				"<div class=\"caption\">"+
				      				"<div id=\"user-info\">"+
				      				"<img id=\"profile\" src=\"/resources/images/uploadFiles/"+this.user.profileImg+"\""+
				      				"onerror=\"this.src='/resources/images/Default-Profile-Picture-Free-PNG-Image.png'\">"+
				      				"<p id=\"user\">"+this.user.nick+"</p>"+
				      				"</div>"+
				      				"<div class=\"info\">"+
				      				"<p class=\"font-size\">관심사 : "+this.categName+"<p>"+
				      				"</div>"+
				      				"<div id=\"bord\"></div>"+
				      				"<div class=\"like-dislike\">"+
				      				"<p class=\"like-dislike-model\"><span id=\"updateLike"+this.certiImgNo+"\" class=\"glyphicon glyphicon-thumbs-down\" aria-hidden=\"true\"></span></p>"+
				      				"&nbsp;"+
				      				"<p class=\"font-size\" id=\"like\">"+this.like+"<p>"+
				      				"<center>"+
				      				"<button type=\"button\" id=\"comment-btn\"class=\"btn btn-default\">댓글 펼치기/접기</button>"+
				      				"</center>"+
				      				"</div>"+
				      				
				      				"<input type=\"hidden\" name=\"certiImgNo\" value=\""+this.certiImgNo+"\">"+
				      				"</div>";
				      				$("#infinit-scroll").append(displayView);
				      			})
			      			}
			      		});
			      				
			      	}
			      
			    })
			  });
			
		$(function(){
			$(document).on("click","#updateLike",function(){
				var certiImgNo=$(this).data("param");
				alert("좋아요!")
				alert(certiImgNo+"certiImgNo")
				$.ajax({
					url:"/challenge/challengeRest/duplicationLike?certiImgNo="+certiImgNo+"&status=1",
		      		method:"GET",
		      		dateType:"json",
		      		headers:{
		      			"Accept":"application/json",
		      			"content-Type":"application/json"
		      		},
				success:function(JSONData){
					if(JSONData.totalCount != 0){
						alert("이미 체크하셨습니다.");
					}else{
						$.ajax({
				      		url:"/challenge/challengeRest/addChallengeReviewLike?certiImgNo="+certiImgNo,
				      		method:"GET",
				      		dateType:"json",
				      		headers:{
				      			"Accept":"application/json",
				      			"content-Type":"application/json"
				      		},
		      				success:function(JSONData){
		      			
			      			alert("성공");
			      			$("#like").remove();
			      			$(JSONData).each(function(){
			      				var displayView ="<p class=\"font-size\" id=\"like\">"+this.like+"<p>"
			      				$("#LikePlace").append(displayView);
			      			});
			      			}
						});
					}
				}
			});
		});
	});	

		$(function(){
			$(document).on("click","#updateDislike",function(){
				var certiImgNo=$(this).data("param");
				alert("싫어요!");
				alert(certiImgNo+"certiImgNo");
				$.ajax({
					url:"/challenge/challengeRest/duplicationLike?certiImgNo="+certiImgNo+"&status=2",
		      		method:"GET",
		      		dateType:"json",
		      		headers:{
		      			"Accept":"application/json",
		      			"content-Type":"application/json"
		      		},
				success:function(JSONData){
					if(JSONData.totalCount != 0){
						alert("이미 체크하셨습니다.");
					}else{
						$.ajax({
				      		url:"/challenge/challengeRest/addChallengeReviewDislike?certiImgNo="+certiImgNo,
				      		method:"GET",
				      		dateType:"json",
				      		headers:{
				      			"Accept":"application/json",
				      			"content-Type":"application/json"
				      		},
				      		success:function(JSONData){
				      			
				      			alert("성공");
				      			$("#dislike").remove();
				      			$(JSONData).each(function(){
				      				var displayView ="<p class=\"font-size\" id=\"dislike\">"+this.dislike+"<p>"
				      				$("#DislikePlace").append(displayView);
				      			});
					      	}
						});
					}
				}
			});
		});
	});	

</script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
		  <p id="header">인증이미지 목록</p>
		</div>
	
		<div id="infinit-scroll">
			<div id="flat">
				<div id="pages">
					<input type="hidden" name="page" value="${page }">
				</div>
			</div>
		<c:forEach var="certiImg" items="${certiImgList }">
			
			    <div class="thumbnail">
				      <img style="width:700px; height:700px; position:relative; top:30px;" src="/resources/images/uploadFiles/${certiImg.certiImg }" 
				      onerror="this.src='https://dummyimage.com/700x700/1af0d4/000000.gif'">
			      <div class="caption">
			     	 <div id="user-info">
				      	<img id="profile" src="/resources/images/uploadFiles/${certiImg.user.profileImg }"
				        		onerror="this.src='/resources/images/Default-Profile-Picture-Free-PNG-Image.png'">
				        <p id="user">${certiImg.user.nick }</p>
			        </div>
			       	<div class="info">
			       		<p class="font-size">관심사 : ${certiImg.categName }</p>
			       	</div>
			       	<div id="bord">
			       	 	<p class="like-dislike-model"><span class="glyphicon glyphicon-thumbs-up" id="updateLike" aria-hidden="true" data-param="${certiImg.certiImgNo}"></span></p>
			       		&nbsp;
			       		<div id="LikePlace"></div>
			       		<p class="font-size" id="like">${certiImg.like }</p>
						
						<p class="like-dislike-model"><span class="glyphicon glyphicon-thumbs-down" id="updateDislike" aria-hidden="true" data-param="${certiImg.certiImgNo}"></span></p>
                         &nbsp;
                         <div id="DislikePlace"></div>
                         <p class="font-size" id="dislike">${certiImg.dislike}<p>
			       	</div>
			       	<center>
			       		<button type="button" id="comment-btn"class="btn btn-default">댓글 펼치기/접기</button> 
			        </center>
			      </div>
			    </div>

		</c:forEach>
		</div>	
	</div>
	
</body>
</html>