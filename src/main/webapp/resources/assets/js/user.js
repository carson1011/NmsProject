// 사용자 사이트 Script


// #lnbWrap - 콘텐츠 길이에 따른 높이 변경
// $(window).scroll(function(){
// 	var contHeight = $('#container').height();
// 	$('#lnbWrap').css('min-height', contHeight);
// });

// #header - 전체메뉴 활성화 / 비활성화
$(function(){
	$("#header .lnb-depth1-item.all > a").click(function(e) {
		e.preventDefault();
		$(this).parent().toggleClass('active');
		$('#allMenu').toggleClass('active');

		//활성화에 따른 왼쪽메뉴 높이 조절
		if($('#allMenu').hasClass('active') == true) {
			$('#pageWrap').addClass('all-menu-open')
		} else {
			$('#pageWrap').removeClass('all-menu-open');
		}
		
	});
});

// #header - depth2 메뉴 활성화
$(function(){
	$("#header #gnb > li.lnb-depth1-item").click(function(e) {
		e.preventDefault();
		$(this).addClass('active').siblings().removeClass('active');
		var area_num = $(this).index();
		if($('#header #gnb > li.lnb-depth1-item').hasClass('active') == true){
		  $('#lnbWrap #depth2Wrap .depth2-list > li').siblings().removeClass('active');
		  $('#lnbWrap #depth2Wrap .depth2-list > li').eq(area_num).addClass('active');
		}
	   });
});

// #header 툴팁 옵션 변경
$(function(){
	$('[data-toggle="tooltip"]').tooltip({trigger : 'hover'}); 
});


// #lnbWrap - my service 아코디언 활성화
$(function(){
	$("#lnb #myService .sub-title .btn-dropdown").click(function(e) {
		e.preventDefault();
		$(this).parent().parent().toggleClass('active');
	});
});

 // #lnbWrap - depth2 메뉴 리스트 아코디언 
 $(function(){
	$(document).on("click", "#lnb #depth2Wrap .sub-title .btn-dropdown", function(e){
	   e.preventDefault();
	   $(this).toggleClass('active');
	   $(this).parent().next('.lnb-depth2').toggleClass('active');
	});
 });


// #lnbWrap - depth2 링크메뉴 아코디언
$(function(){
	$(document).on("click", "#lnbWrap #lnb .btn-dropdown-depth", function(e){
	   e.preventDefault();
	   $(this).parent().parent().toggleClass('active');
	});
 });



//전체메뉴(all-menu) - 닫기버튼
$(function(){
	$("#allMenu .all-menu-top .btn-close").click(function(e) {
		e.preventDefault();
		$('#allMenu').toggleClass('active');
		$('#header .lnb-depth1-item.all').removeClass('active');

		//활성화에 따른 왼쪽메뉴 높이 조절
		if($('#allMenu').hasClass('active') == true) {
			$('#pageWrap').addClass('all-menu-open')
		} else {
			$('#pageWrap').removeClass('all-menu-open');
		}
	});
});


// 전체메뉴(all-menu) - 북마크 활성화
$(function(){
	$("#allMenu .bookmark").click(function(e) {
	   e.preventDefault();
	   // active 상태인지 여부를 확인
	   if($(this).hasClass('active') === true){
		 
		 // 선택된 북마크의 상위 클래스명을 remove_target 변수
		 var remove_target = $(this).parent().parent().attr("id");
  
		 // ul 하위 element의 개수만큼 반복문
		 $('#myService .lnb-depth2').children().each(function(i, e){
		   // remove_target 변수와 ul 하위 element의 아이디가 같다면 삭제 
		   if(remove_target == $(e).attr("id")){
			 $(e).remove();
		   }
		 });
	   }else{
		 // myService에 추가
		 var clone = $(this).parent().parent().clone();
		//  var origin = clone.find("img").attr("src");   
		//  var originArray = origin.split('/');
		//  var src = originArray[0]+'/'+originArray[1]+'/'+originArray[2]+'/'+originArray[3]+'/'+'my_'+originArray[4];
		//  clone.find(".depth2 .link .depth-icon-img img").attr("src",src);   
 
	   
		// 3 depth 클래스명을 가져온다            
		var depth3Yn = $(this).parent().parent().children('ul').attr('class');
		if(!depth3Yn == '' || depth3Yn == 'undefined'){
		clone.find(".depth2").append("<a href class='btn-dropdown-depth'></a>");
		}

		clone.appendTo('#myService .lnb-depth2');
		}
  
	   $(this).toggleClass('active');
  
	});
});


// #lnbWrap 스크롤바
$(function(){
	$(window).on("load",function(){
		$(".scroll-bar").mCustomScrollbar({theme:'minimal'});
	});
})

// 사용자 알림
$(function(){
	$(document).on("click", "#header .notification-btn", function(e){
	   e.preventDefault();
	   $(this).parent().toggleClass('active');
	});

	$('html').click(function(e) { if(!$(e.target).hasClass("notification-btn")) { 
			$('#header .notification-area').removeClass('active');
		} 
	});
});

// 사용자 정보 
$(function(){
	$(document).on("click", "#header .user-info-btn", function(e){
	   e.preventDefault();
	   $(this).parent().toggleClass('active');
	});

	$('html').click(function(e) { if(!$(e.target).hasClass("user-info-btn")) { 
			$('#header .user-info-area').removeClass('active');
		} 
	});
});
