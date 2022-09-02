<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body class="user-site">
    <div id="pageWrap">
        <!-- header -->
        <header id="header">
            <!-- left-menu WRAP -->
            <div class="left-wrap">
                <div class="header-top">
                    <h1>
                        <a href="/hmi/hmi">
                            <p class="sr-only">KDN</p>
                        </a>
                    </h1>
                </div>
                <div class="header-mid">
                    <div class="scroll-bar">
                        <!-- gnb -->
                        <nav id="gnb">
                            <ul class="depth1-list">
                                <!-- 1 -->
                                <li class="depth1-item" id="menu00">
                                    <a href="/hmi/hmi">
                                        <div class="depth-icon-img">
                                            <img src="/static/assets/img/admin/ico_dashboard.png" alt="">
                                        </div>
                                        <span>메인 모니터링</span>
                                    </a>
                                </li>
                                <!-- 2 -->
                                <sec:authorize access="hasAnyRole('ROLE_ADM','ROLE_DPM')">
 								<li class="depth1-item">
									<a href="">
										<div class="depth-icon-img">
									       <img src="/static/assets/img/admin/ico_computer.png" alt="">
										</div>
								        <span>장비 관리</span>
                                        <em class="arr"></em>
									</a>
									<ul class="depth2-list">
                                        <li class="depth2-item" id="menu0101">
                                            <a href="/device/dvMngmt" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_app4.png" alt="device" class="icon">
                                                </div>
                                                <span>디바이스 관리</span>
                                            </a>
                                        </li>
                                        <li class="depth2-item" id="menu0102">
                                            <a href="/device/dvVerMngmt" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_computer3.png" alt="" class="icon">
                                                </div>
                                                <span>디바이스 버전관리</span>
                                            </a>
                                        </li>
										<li class="depth2-item" id="menu0103">
											<a href="/workspace/wsMngmt" class="link">
												<div class="depth-icon-img">
												    <img src="/static/assets/img/admin/ico_app2.png" alt="workspace" class="icon">
												</div>
												<span>작업장 관리</span>
											</a>
										</li>
										<li class="depth2-item" id="menu0104">
											<a href="/workspace/wsTimeMngmt" class="link">
												<div class="depth-icon-img">
												    <img src="/static/assets/img/admin/ico_app2.png" alt="worktime" class="icon">
												</div>
												<span>작업장 작업시간 관리</span>
											</a>
										</li>
                                         <li class="depth2-item" id="menu0106">
                                            <a href="/workspace/wsOccSet" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_computer2.png" alt="" class="icon">
                                                </div>
                                                <span>작업장 재실인원 설정</span>
                                            </a>
                                        </li>
                                        
									</ul>
								</li> 
								</sec:authorize>
								
                                <!-- 3 -->
                                <li class="depth1-item">
                                    <a href="">
                                        <div class="depth-icon-img">
                                            <img src="/static/assets/img/admin/ico_server2.png" alt="">
                                        </div>
                                        <span>통계 관리</span>
                                        <em class="arr"></em>
                                    </a>
                                    <ul class="depth2-list">
                                        <li class="depth2-item" id="menu0200">
                                            <a href="/stat/stList" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_chart.png" alt="" class="icon">
                                                </div>
                                                <span>작업장 통계 관리</span>
                                            </a>
                                        </li>
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                        <li class="depth2-item" id="menu0201">
                                            <a href="/stat/stManagement" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_chart2.png" alt="" class="icon">
                                                </div>
                                                <span>이벤트 데이터 관리</span>
                                            </a>
                                        </li>
                                        <li class="depth2-item" id="menu0201">
                                            <a href="/stat/stCommand" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_chart2.png" alt="" class="icon">
                                                </div>
                                                <span>명령 데이터 관리</span>
                                            </a>
                                        </li>
                                        </sec:authorize>
                                    </ul>
                                </li>
                                <!-- 4 -->
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <li class="depth1-item">
                                    <a href="">
                                        <div class="depth-icon-img">
                                            <img src="/static/assets/img/admin/ico_adminmana.png" alt="">
                                        </div>
                                        <span>사용자 관리</span>
                                        <em class="arr"></em>
                                    </a>
                                    <ul class="depth2-list">
                                       <li class="depth2-item" id="menu0301">
                                            <a href="/member/mbList" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_server6.png" alt="" class="icon">
                                                </div>
                                                <span>사용자 목록</span>
                                            </a>
                                        </li>
                                        <li class="depth2-item" id="menu0300">
                                            <a href="/member/mbAdd" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_usersetting.png" alt="" class="icon">
                                                </div>
                                                <span>사용자 추가</span>
                                            </a>
                                        </li>
                                        <li class="depth2-item" id="menu0302">
                                            <a href="/member/mbReqChk" class="link">
                                                <div class="depth-icon-img">
                                                    <img src="/static/assets/img/admin/ico_usersetting.png" alt="" class="icon">
                                                </div>
                                                <span>비밀번호 변경 요청</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                </sec:authorize>
                            </ul>
                        </nav>
                        <!-- //gnb -->
                    </div>
                </div>
                <div class="header-bottom">
                    <div class="user-btn-area">
                        <a href="" class="user-btn">
                            <span class="name">${s_name}&nbsp;님</span>
                            <em class="etc"></em>
                        </a>
                    </div>
                    <div class="user-popup">
                        <div class="inner">
                            <ul>
                                <li>
                                    <a href="/member/modify">
                                        <i class="xi-user-plus-o color-secondary"></i>
                                        <span>개인정보 수정</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="memberlogout">
                                        <i class="xi-power-off color-danger"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- // left-menu WRAP -->
<!--             <button type="button" id="fullScreenMode">ok</button> -->
            <input type="hidden" id="auth" name="auth" value="${s_auth }">
            <input type="hidden" id="empno" name="empno" value="${s_empno }">
            <input type="hidden" id="name" name="name" value="${s_name }">
        </header>
        <form action="/member/logout" method="post" id="memberlogoutForm">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
		</form>
        <script>
	    $(function(){
	        $(".memberlogout").on("click",function(e){
	            e.preventDefault();
	            $("#memberlogoutForm").submit();
	        });
	        
/* 	        var docV = document.documentElement;
	        // 전체화면 설정
	        function openFullScreenMode() {
	        	console.log("open");
	            if (docV.webkitRequestFullscreen){ // Chrome, Safari (webkit)
	                console.log("webkit");
	                docV.webkitRequestFullscreen();
	            }else if (docV.mozRequestFullScreen){ // Firefox
	            	console.log("moz");
	                docV.mozRequestFullScreen();
	            }else if (docV.msRequestFullscreen){ // IE or Edge
	            	console.log("IE");
	                docV.msRequestFullscreen();
	            }else if(docV.requestFullscreen){
	            	console.log("else");
	                docV.requestFullscreen();
	            }
	        }
	        $( document ).ready(function() {
		        $("#fullScreenMode").trigger("click");
	        });
	        $('#fullScreenMode').on('click',function(){
	        	openFullScreenMode();
	        }); */
	    });
		</script>
        <!-- //header -->