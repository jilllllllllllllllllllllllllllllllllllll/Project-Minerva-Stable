$(document).ready(function() {
	$('ul.search').click(function(event){
		$(this).css('background', '#2a6cbe');
		$('.search .menu').css('display', 'block');
		$('.students .menu').css('display', 'none');
		$('.add .menu').css('display', 'none');
		$('ul.students').css('background', 'none');
		$('ul.add').css('background', 'none');
		event.stopPropagation();
	});
	$('ul.students').click(function(event){
		$(this).css('background', '#2a6cbe');
		$('.students .menu').css('display', 'block');
		$('.search .menu').css('display', 'none');
		$('.add .menu').css('display', 'none');
		$('ul.search').css('background', 'none');
		$('ul.add').css('background', 'none');
		event.stopPropagation();
	});
	$('ul.add').click(function(event){
		$(this).css('background', '#2a6cbe');
		$('.add .menu').css('display', 'block');
		$('.students .menu').css('display', 'none');
		$('.search .menu').css('display', 'none');
		$('ul.students').css('background', 'none');
		$('ul.search').css('background', 'none');
		event.stopPropagation();
	});
	$(document).click(function(){
		$('ul.students').css('background', 'none');
		$('ul.search').css('background', 'none');
		$('ul.add').css('background', 'none');
		$('.students .menu').css('display', 'none');
		$('.search .menu').css('display', 'none');
		$('.add .menu').css('display', 'none');
	});
});