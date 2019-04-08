<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>main화면</title>
	<style>
		  /* *{border:1px solid blue;}   */
		body{
			font-size: "나눔고딕", "Nanum Gothic", san-serif;
			margin:0;
			font-size: 12px;
		}
		a{
			color:#000000;
			text-decoration: none;
		}
		ul,li{
			list-style:none;
			padding: 0;
			margin:0;
		}
		.clear{
			clear:both;
		}
		#mainTop{
			width: 100%;
			background: #00a085;
			padding: 10px;
		}
		.btnMain{
			color:#ffffff;
			font-size: 11px;
			font-weight: bold;
			margin-right: 30px;
		}
		.btnMain img{
			position: relative;
			top:4px;
			margin-right: 4px;
		}
		.btnMainRight{
			float:right;
		}
		#wrap{
			width: 960px;
			min-height: 400px;
			margin:0 auto;
		}
		#header{
		/* 	border:1px solid green; */
			width: 100%;
			padding: 10px 0px;
		}
		#header .logo img{
			width: 60px; /* 이미지 영역 폭을 60px로 지정*/
			/* border: 1px dotted yellow; */
		}
		#header form{
		     float:left; 
		     display: inline-block; 
		     margin-top: 30px;
	    }
		#header #searchInput{
			position: relative;
			top:-20px;/* 기본 위치에서 위로 20 px 이동*/
			width: 400px;
			margin-left:100px;
			/* border: 1px solid yellowgreen; */
		}
		 #header .btnSearch{
			position:relative;
			top:-20px;
			display: inline-block;
			width: 50px;
			padding: 2px;
			background:#00a085;
			color:#ffffff;
			text-align: center;
			font-size: 11px;
			margin-right: 100px;
		}

		#header .headerRight{
			float:right;
			position: relative;
			top:12px;
			color:#00a085;
			font-size: 14px;
			margin-left:20px;
			/* border:1px solid blue; */
		}
       	#header .headerRight img{
       		position: relative;
       		top:4px;
       		margin-right: 4px;
       	}
        .mainContent{
        	width: 85%;
        	min-height: 500px;
        	float:left;
        } 
        .subContent{
        	width: 15%;
        	min-height: 500px;
        	float:left;
        }
		.subContent ul li{
			padding:0px 0px 10px 5px;
		}
		.subContent ul li a{
			color:#00a085;
			font-size: 14px;
		}
        .subContent .btnSubListMore{
        	font-size: 11px;
        }

        .thirdContent{
        	padding-left: 5%;
        	width:30%;
        	min-height: 500px;
        	float:left;
        }

        .content{
        	width:65%;
        	overflow: hidden;/* 영역을 벗어난 콘텐츠 숨기기*/
        	float:left;
        }
        .imageCaption{
        	position: relative;
        	height: 80px;
        	top:-136px;/* 기준 위치에서 위로 136px 위로 올림 */
        	background: #111111;
        	padding:5%;
        }
        .imageCaption .title a{
        	font-size: 16px;
        	font-weight: bold;
        	color:#00a085;
        }
        .imageCaption .subTitle{
        	font-size: 12px;
        	color: #666666;
        }
        .imageContainer{
        	height: 360px;
        }
        .thumbContainer ul li{
        	float:left;
        }
        .thumbContainer{
/*         	height: 360px; */
        	width: 100%;
        }
        .thumbContainer ul{
        	width: 960px;
        	height: 150px;
        	overflow: hidden;
        }
        .thumbnail{
        	display: inline-block;
        	height: 120px;
        	background: #ffffff;
        	border-left:1px solid #666666;
        	border-bottom: 1px solid #66666;
        }
		.thumbnail:hover{
			border-bottom: 5px solid #00a085;
		}
        .thumbTitle{
        	padding:5px;
        }
        .thumbImg{ /* 이미지 영역의 크기 를 벗어난 부분은 숨기기*/
        	width: 150px;
        	height: 80px;
        	overflow: hidden;
        }
        .webzineContainer{
        	width: 100%;
        	min-height: 500px;
        }
        .webzineContainer .wzBar{
        	width:94%;
        	padding:3%;
        	background: #00a085;
        }

        .webzineContainer ul li{
        	height: 85px;
        	padding-top: 10px;
        	padding-bottom: 10px;
        	clear:both;
        	border-bottom: 1px solid #999999;
        }
        .webzineContainer .wzBar a{
            color:#8dc9bc;
            margin-right: 30px;
            font-weight: bold;
        }
        .webzineContainer .wzBar .active, .webzineContainer .wzBar a:hover{
        	color:#ffffff;
        }
        .webzineContainer .wzText{
			float:left;
			width: 60%;
			padding-left: 3%;
        }
        .webzineContainer .wzText h4{
        	margin-top: 4px;
        }
        .webzineContainer .wzImg{
        	float:left;
        }
        .trendBox{
        	padding: 4%;
        	width: 91%;
        	border:1px solid #dddddd;
        }

        .trendBox .trendTitle{
        	font-size: 14px;
        	font-weight: bold;
        	color: #00a085;
        }
		.trendBox .trendTitle img{
			position: relative;
			top:6px;
		}
		.trendTable{
			width: 95%;
			padding-left: 5%;
			margin-top: 15px;
			border-top:1px solid #dddddd;
			padding-top:10px;
		}
		.trendTable ul li a{
			 color:#666666;
			 font-size: 14px;
		}
		.trendTable ul li span{
			color:#00a085;
			width: 20px;
			text-align: right;
			display: inline-block;
			margin-right: 5px;
		}

		.weatherBox{
			padding: 4%;
			width: 91%;
			border: 1px solid #dddddd;
			margin-top:20px;
		}
        
        .wTitle{
        	width: 100%;
        	font-size: 14px;
        	font-weight: bold;
        	color:#00a085;
        	border-bottom: 1px solid #dddddd;
        	padding-bottom: 10px;
        }
		.weatherBox table{
			width: 100%;
		}	
		.weatherBox table td{
			text-align: center;
		}
		.wTxt span{
			color:#999999;
		}
		.wItem{
			border-right: 1px solid #dddddd;
		}
		.wItemLast{
			border:none;
		}

		#footer{
			background: #333333;
			height: 50px;
			padding: 20px;
			font-size: 14px;
			font-weight: bold;
			color:#ffffff;
			text-align: center;
		}

        
	</style>
</head>
<body>
	<div id="mainTop">
		<a class="btnMain" href="#"><img src="img/home-white.png">홈</a>
		<a class="btnMain" href="https://nid.naver.com/nidlogin.login?url=http%3A%2F%2Fmail.naver.com%2F">메일</a>
		<a class="btnMain" href="#">뉴스</a>
		<a class="btnMain" href="https://finance.naver.com/">주식</a>
		<a class="btnMain" href="https://sports.news.naver.com/index.nhn">스포츠</a>
		<a class="btnMain" href="#">사진</a>
		<a class="btnMain" href="#">동영상</a>
		<a class="btnMain" href="#">검색</a>
		<a class="btnMain" href="#">뷰티</a>
		<a class="btnMainRight btnMain" href="#"><img src="img/br.png">브라우저 업그레이드</a>
		<div class="clear"></div>
	</div>
	<div id="wrap">
	  <div id="header">
	  	<a class="olgo" href="#" style="float:left"><img src="img/logo-1.png"></a>
	  	<form action="https://search.naver.com/search.naver" >
        
	  		<input type="text" id="searchInput" name="query"  placeholder="검색어">
	  		<input type="submit" value="검색" class="btnSearch"> 
	  	<!-- <input type="text" id="searchInput" name="searchInput"> -->
	 	</form> 
	 <!--  <input type="text" id="searchInput" name="query"  placeholder="검색어">
	 <a class="btnSearch" href="https://search.naver.com/search.naver?query=">검색하기</a> -->
	<!-- </form> -->
	  	        
	  	<div class="headerRight">
	  		<a class="btnHeaderRight" href="#">마이페이지</a>
	  		<a class="btnHeaderRight" href="#"><img src="img/login.png">로그인</a>
	  		<a class="btnHeaderRight" href="#"><img src="img/mail.png">메일</a>
	  	</div>
	  	<div class="clear"></div>
	  </div>	<!-- header 끝 -->
	  <div id="content">
	  	<div class="subContent">
	  		<ul>
	  		   <li>
	  		   <a class="btnSubList" href="https://nid.naver.com/nidlogin.login?url=http%3A%2F%2Fmail.naver.com%2F"><img src="img/sicon1.png">메일</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="https://media.daum.net/">
	  		   	  <img src="img/sicon2.png">뉴스</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="https://sports.news.naver.com/index.nhn"><img src="img/sicon3.png">스포츠</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="https://finance.naver.com/"><img src="img/sicon4.png">경제</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="#"><img src="img/sicon5.png">날씨</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="#"><img src="img/sicon6.png">영화</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="#"><img src="img/sicon7.png">자동차</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="#"><img src="img/sicon8.png">뷰티</a>	
	  			</li>
	  			<li>
	  		   <a class="btnSubList" href="#"><img src="img/sicon9.png">패션</a>	
	  			</li>
	  			<li>
	  				<a clss="btnSubListMore" href="#">더 많은 서비스보기</a>
	  			</li>
	  		</ul>
	  	</div><!-- subContent 끝. -->
        <div class="mainContent">
        	<div class="content">
        		<div class="imgageContent"><!-- 이미지 콘텐츠 영역 div -->
        			<div class="imageContainer"><!-- 이미지요소를 담은 div -->
        				<img src="img/slide1.jpg">
        				<div class="imageCaption">
        					<div class="title">
        						<a href="#">안녕하세요. 오늘의 뉴스입니다.</a>
        					</div>
        					<div class="subTitle">
        						HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다! HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다! HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        					</div>	
        				</div><!-- imageCaption 끝. -->
        			</div><!-- imageContainer 끝. -->
        			<div class="thumbContainer">
        				<ul>
        					<li>
        						<a class="thumbnail" href="#">
        							<div class="thumbImg"><img src="img/thumb1.jpg"></div>
        							<div class="thumbTitle">오늘의 뉴스요약1</div>
        					    </a>
        					</li>
        					<li>
        						<a class="thumbnail" href="#">
        							<div class="thumbImg"><img src="img/thumb2.jpg"></div>
        							<div class="thumbTitle">오늘의 뉴스요약2</div>
        					    </a>
        					</li>
        					<li>
        						<a class="thumbnail" href="#">
        							<div class="thumbImg"><img src="img/thumb3.jpg"></div>
        							<div class="thumbTitle">오늘의 뉴스요약3</div>
        					    </a>
        					</li>
        					<li>
        						<a class="thumbnail" href="#">
        							<div class="thumbImg"><img src="img/thumb4.jpg"></div>
        							<div class="thumbTitle">오늘의 뉴스요약4</div>
        					    </a>
        					</li>
        					<li>
        						<a class="thumbnail" href="#">
        							<div class="thumbImg"><img src="img/thumb5.jpg"></div>
        							<div class="thumbTitle">오늘의 뉴스요약5</div>
        					    </a>
        					</li>
        				</ul>
        				<div class="clear"></div>
        			</div><!-- thumbContainer -->
        		</div><!-- imgageContent 끝. -->
        		<div class="webzineContainer">
        				<div class="wzBar">
        					<a href="active" href="#">모두</a>
        					<a href="#">정치</a>
        					<a href="#">스포츠</a>
        					<a href="#">연예</a>
        					<a href="#">IT</a>
        				</div><!-- wzBar 끝.-->
        				<ul class="wzContainer">
        					<li>
        						<a href="#">
        							<img class="wzImg" src="img/thumb1.jpg">
        							<div class="wzText">
        							<h4>안녕하세요 새로운 뉴스입니다.</h4>
        							<p>
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        							</p>
        						</a>
        					</li>
        					<li>
        						<a href="#">
        							<img class="wzImg" src="img/thumb2.jpg">
        							<div class="wzText">
        							<h4>안녕하세요 새로운 뉴스입니다.</h4>
        							<p>
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        							</p>
        						</a>
        					</li>
        					<li>
        						<a href="#">
        							<img class="wzImg" src="img/thumb3.jpg">
        							<div class="wzText">
        							<h4>안녕하세요 새로운 뉴스입니다.</h4>
        							<p>
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        								HTML/CSS 활용공부를 하고 있습니다. 다들 화이팅입니다!
        							</p>
        						</a>
        					</li>
        				</ul><!-- wzContainer 끝. -->
        				<div class="clear"></div>
        		</div><!-- webzineContainer 끝. -->
        	</div><!-- content 끝. -->
        	<div class="thirdContent">
				<div class="trendBox">
					<span class="trendTitle"><img src="img/sicon1.png">실시간 검색어</span>
					<table class="trendTable">
						<tr>
							<td>
								<ul>
									<li><a href="#"><span>1</span>프로야구</a></li>
									<li><a href="#"><span>2</span>삼시세끼</a></li>
									<li><a href="#"><span>3</span>이서진</a></li>
									<li><a href="#"><span>4</span>나피디</a></li>
									<li><a href="#"><span>5</span>정치인</a></li>
								</ul>
							</td>
							<td>
								<ul>
									<li><a href="#"><span>6</span>CSS</li>
									<li><a href="#"><span>7</span>HTML</li>
									<li><a href="#"><span>8</span>웹퍼블리싱</li>
									<li><a href="#"><span>9</span>자바스크립트</li>
									<li><a href="#"><span>10</span>서태지</li>
								</ul>
							</td>
						</tr>
					</table>	
				</div>	<!-- trendBox 끝. -->  
				<div class="weatherBox">
					<div class="wTitle">날씨</div>
					<table>
					<tr>
						<td>
							<div class="wItem">
								<img src="img/wh1.jpg">
								<div class="wTxt">
									29도
								<span>10도</span>
							    </div>
							</div>		
						</td>
						<td>
							<div class="wItem">
								<img src="img/wh2.jpg">
								<div class="wTxt">
									29도
								<span>10도</span>
							    </div>
							</div>		
						</td>
						<td>
							<div class="wItem wItemLast">
								<img src="img/wh3.jpg">
								<div class="wTxt">
									29도
								<span>10도</span>
							    </div>
							</div>		
						</td>
					</tr>
				</table><!-- weather table 끝. -->
				</div>      		
        	</div><!-- thirdContent 끝. -->			
        </div><!-- mainContent 끝. -->
        <div class="clear"></div>
	  </div><!-- id=content끝. -->	
	  <div id="footer">
	  	<span> 2019. choong-ang All rights reserved. </span>
	  </div>	
	</div>
</body>
</html>