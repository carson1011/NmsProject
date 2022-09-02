// 관리자 사이트 Script

// #gnb - depth1 아코디언
 $(function(){
	$(document).on("click", "#header #gnb .depth1-item > a", function(e){
		if($(this).next('.depth2-list').length == 1) {
			e.preventDefault();
			$(this).parent().toggleClass('active');
			// $(this).parent().addClass('active').siblings().removeClass('active');
	   }
	});
 });

 //gnb 3depth 여부에 따라 arr 아이콘 추가
 $(function(){
	 $('#header #gnb .depth2-list').children().each(function(e){
		 if($(this).children('.depth3-list').length == 1) {
			 $(this).addClass('hassub');
		 }
	 });
 });

 //gnb 3depth 활성화 / 비활성화
 $(function(){
	 $(document).on('click', '#header .hassub > .link', function(e){
		 e.preventDefault();
		 $(this).parent().toggleClass('open');

	 });
 });

// gnb 북마크 활성화
$(function(){
	$("#gnb .bookmark").click(function(e) {
	   e.preventDefault();
	   // active 상태인지 여부를 확인
	   if($(this).hasClass('active') === true){
		 // 선택된 북마크의 상위 아이디를 remove_target 변수에 저장
		 var remove_target = $(this).parent().attr("id");
		 // ul 하위 element의 개수만큼 반복문
		 $('#myService .depth2').children().each(function(i, e){
		   // remove_target 변수와 ul 하위 element의 아이디가 같다면 삭제
		   if(remove_target == $(e).attr("id")){
			 $(e).remove();
		   }
		 });
	   } else {
		 // myService에 추가
			var clone = $(this).parent().clone();
			clone.find(".bookmark").attr("class", 'bookmark active');   
			clone.appendTo('#myService .my-link .depth2');
		}
	   $(this).toggleClass('active');  
	});
  });

//my service 북마크 제거
$(function(){
	$(document).on("click", "#myService .bookmark", function(e){
	   e.preventDefault();
	   // active 상태인지 여부를 확인
	   if($(this).hasClass('active') === true){
			// 선택된 북마크의 상위 아이디를 remove_target 변수에 저장
			var itemMark = $(this).parent();
			var remove_target = $(itemMark).attr("id");
			// ul 하위 element의 개수만큼 반복문
			$('#gnb li').find('.depth2-item').each(function(i, e){
			// remove_target 변수와 ul 하위 element의 아이디가 같다면 삭제
			if(remove_target == $(e).attr("id")){
				itemMark.remove();
				//gnb 해당 메뉴의 bookmark 비활성화
				$(e).find('.bookmark').removeClass('active');
			}
		 });
	   }
	});
});

// header 스크롤바
$(function(){
	$(window).on("load",function(){
		$(".scroll-bar").mCustomScrollbar({theme:"minimal"});
	});
});

// 관리자 알림 
$(function(){
	$(document).on("click", "#header .header-bottom .user-btn", function(e){
	   e.preventDefault();
	   $(this).parent().parent().toggleClass('active');
	});

	$('html').click(function(e) { if(!$(e.target).hasClass("header-bottom")) { 
			$('#header .header-bottom').removeClass('active');
		} 
	});
});

// contents 툴팁 옵션 변경
$(function(){
	$('[data-toggle="tooltip"]').tooltip({trigger : 'hover'}); 
});
