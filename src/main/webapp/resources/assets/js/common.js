// 패널 기본 액선
$(function(){
	$(document).on('click', '.panel-action[data-action]', function(event) {
		event.preventDefault();
		switch( $(this).attr('data-action') ) {
			// 토글
			case 'panel-toggle' :
				$(this).find('i')
					.toggleClass('fa-chevron-up')
					.toggleClass('fa-chevron-down');
				$(this).closest('.panel').toggleClass('is-collapse');
				break;
			case 'panel-remove' :
				$(this).closest('.panel').toggleClass('is-close');
				break;
			case 'panel-refreh' :
		          $loading = $('<div class="panel-loading">' +
	            	'<div class="loader loader-default"></div>' +
	            	'</div>');

				$(this).closest('.panel')
						.addClass('is-loading')
						.append($loading);
				break;
		}
	});
});

// 툴팁 초기화
// $(function(){
// 	$('[data-toggle="tooltip"]').tooltip();
// });

//font-icon feather
$(function () {
    feather.replace({width: '1em', height: '1em'});
});

// 팝오버 초기화
$(function () {
    $('[data-toggle="popover"]').popover();
});

// 테이블
$(function(){
	// 테이블 섹션
	$(document).on('click', 'table .table-section', function(event) {
		$(this).toggleClass('active');
	});

	// 전체 선택 
	$(document).on('click', 'table .selectable-toggle', function(event) {
		var is_active = $(this).prop('checked');
		$(this).parents('table')
			.find('.selectable').prop('checked', is_active);
	});
});

// panel tab - vertical 최소높이 조절
$(function () {
	var tabsHeight = $('.nav-tabs-vertical .nav-tabs').height();
	$('.nav-tabs-vertical .nav-tabs + .tab-content').css('min-height', tabsHeight);
});

// 콘텐츠 스크롤 추가 
$(function(){
	$(window).on("load",function(){
		$(".scroll-content").mCustomScrollbar();
		$(".scroll-content-x").mCustomScrollbar({
			axis:"x"
		});
		$(".scroll-content-xy").mCustomScrollbar({
			axis:"yx"
		});
	});
});

// accordion open on hover
$(function () {
    $(".accordion-open-hover").mouseover(function(){
		$(this).trigger( "click" );
	 });
});

//input label-placeholder
$(function (){
    $(document).on('click', '.label-placeholder', function() {
		if($(this).children('.disabled').length == 0) {
			$(this).addClass('active');
		}
	});	
});

//textarea counter
$(function() {
	$('.textarea-counter textarea').keyup(function (e){
		var content = $(this).val();
		var maxLength = $(this).attr('maxlength');
		$(this).next('.counter-badge').html(content.length + '/' + maxLength);
	});
	$('.textarea-counter textarea').keyup();
});

//switch width 
$(function() {
	$('.switch-group .switch').keyup(function (e){
		var textOff = $(this).children('.switch-text-off').width();
		$(this).width(textOff + 33);
	});
	$('.switch-group .switch').keyup();
});

//form wizard 
$(document).ready(function () {
	//Wizard
	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

		var $target = $(e.target);
	
		if ($target.parent().hasClass('disabled')) {
			return false;
		}
	});

	$(".next-step").click(function (e) {

		var $active = $('.form-wizard-group .nav-tabs li.active');
		$active.next().removeClass('disabled');
		nextTab($active);

	});
	$(".prev-step").click(function (e) {

		var $active = $('.form-wizard-group .nav-tabs li.active');
		prevTab($active);

	});
});

function nextTab(elem) {
	$(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
	$(elem).prev().find('a[data-toggle="tab"]').click();
}

//form - dots
jQuery(document).ready(function() {
	// click on next button
	jQuery('.form-wizard-next-btn').click(function() {
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		var next = jQuery(this);
		var nextWizardStep = true;
		parentFieldset.find('.wizard-required').each(function(){
			var thisValue = jQuery(this).val();

			if( thisValue == "") {
				jQuery(this).siblings(".wizard-form-error").slideDown();
				nextWizardStep = false;
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
		if( nextWizardStep) {
			next.parents('.wizard-fieldset').removeClass("show","400");
			currentActiveStep.removeClass('active').addClass('activated').next().addClass('active',"400");
			next.parents('.wizard-fieldset').next('.wizard-fieldset').addClass("show","400");
			jQuery(document).find('.wizard-fieldset').each(function(){
				if(jQuery(this).hasClass('show')){
					var 
          Atrr = jQuery(this).attr('data-tab-content');
					jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
						if(jQuery(this).attr('data-attr') == formAtrr){
							jQuery(this).addClass('active');
							var innerWidth = jQuery(this).innerWidth();
							var position = jQuery(this).position();
							jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
						}else{
							jQuery(this).removeClass('active');
						}
					});
				}
			});
		}
	});
	//click on previous button
	jQuery('.form-wizard-previous-btn').click(function() {
		var counter = parseInt(jQuery(".wizard-counter").text());;
		var prev =jQuery(this);
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		prev.parents('.wizard-fieldset').removeClass("show","400");
		prev.parents('.wizard-fieldset').prev('.wizard-fieldset').addClass("show","400");
		currentActiveStep.removeClass('active').prev().removeClass('activated').addClass('active',"400");
		jQuery(document).find('.wizard-fieldset').each(function(){
			if(jQuery(this).hasClass('show')){
				var formAtrr = jQuery(this).attr('data-tab-content');
				jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
					if(jQuery(this).attr('data-attr') == formAtrr){
						jQuery(this).addClass('active');
						var innerWidth = jQuery(this).innerWidth();
						var position = jQuery(this).position();
						jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
					}else{
						jQuery(this).removeClass('active');
					}
				});
			}
		});
	});
	//click on form submit button
	jQuery(document).on("click",".form-wizard .form-wizard-submit" , function(){
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		parentFieldset.find('.wizard-required').each(function() {
			var thisValue = jQuery(this).val();
			if( thisValue == "" ) {
				jQuery(this).siblings(".wizard-form-error").slideDown();
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
	});
	// focus on input field check empty or not
	jQuery(".form-control").on('focus', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().addClass("focus-input");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
		}
	}).on('blur', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().removeClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideDown("3000");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideUp("3000");
		}
	});
});


// file upload
$(function() {
	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
			numFiles = input.get(0).files ? input.get(0).files.length : 1,
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [numFiles, label]);
	  });
	  
	$(document).ready( function() {
		$('.btn-file :file').on('fileselect', function(event, numFiles, label) {
			var input_label = $(this).closest('.custom-file-group').find('.file-input-label'),
				log = numFiles > 1 ? numFiles + ' files selected' : label;
	
			if( input_label.length ) {
				input_label.text(log);
			} else {
				if( log ) alert(log);
			}
		});
	});
});

//dropdown 
$(function (){
	$('.dropdown .dropdown-collapse > a').on('click', function(){
		$(this).parent().toggleClass('active');
		return false;
	});

	//hover
	$('.dropdown.dropdown-hover').on('mouseenter', function(){
		$(this).children('.dropdown-menu').css('display', 'block');
	});
	$('.dropdown.dropdown-hover').on('mouseleave', function(){
		$(this).children('.dropdown-menu').css('display', 'none');
	});
});

//card-type1 
$(function (){
	$('.card-type1 .card-footer-btn').on('click', function(){
		$(this).parents('.card').toggleClass('card-footer-active');
		return false;
	});
});


//dashboard 
$(function (){
	$('.dashboard-wrap .dashboard-size').on('click', function(){
		$(this).parents().find('#pageWrap').toggleClass('dashboard-full');
		$('.panel').find('.chart').each(function(){
			resize();
		});
		return false;
	});
});

//탭메뉴 가로스크롤 .children('.nav-tabs-wrap') 삭제
$(function(){
	if($('.inner-wrap').length == 1) {

		var hidWidth;
		var scrollBarWidths = 40;

		var widthOfList = function(){
		var itemsWidth = 0;
		$('.nav-tabs-wrap .list li').each(function(){
			var itemWidth = $(this).outerWidth();
			itemsWidth+=itemWidth;
		});
		return itemsWidth;
		};

		var widthOfHidden = function(){
		return (($('.nav-scr').outerWidth())-widthOfList()-getLeftPosi())-scrollBarWidths;
		};

		var getLeftPosi = function(){
		return $('.nav-tabs-wrap .list').position().left;
		};

		var reAdjust = function(){
		//버튼 없애는거 주석처리
		/*
		if (($('.nav-scr').outerWidth()) < widthOfList()) {
			$('.nav-scroll-right').show();
		}
		else {
			$('.nav-scroll-right').hide();
		}

		if (getLeftPosi()<0) {
			$('.nav-scroll-left').show();
		}
		else {
			$('.item').animate({left:"-="+getLeftPosi()+"px"},'slow');
			$('.nav-scroll-left').hide();
		}
		*/
		}

		reAdjust();

		$(window).on('resize',function(e){
			reAdjust();
		});

		var click = true;

		$('.nav-scroll-right').click(function() {
		 if (click) {
				click = !click;
				 if(widthOfHidden() < -10){
		 			$('.nav-tabs-wrap .list').animate({left:"-=300px"},'slow');
		 		 }
				// 타이밍 추가
				setTimeout(function () {
						click = true;
				}, 1000)
		 }
		});


		$('.nav-scroll-left').click(function() {
			if (click) {
         click = !click;
				 if(getLeftPosi() < 0){
				 	$('.nav-tabs-wrap .list').animate({left:"+=300px"},'slow');
				 }
         // 타이밍 추가
         setTimeout(function () {
             click = true;
         }, 1000)
      }
		});
	}


});
