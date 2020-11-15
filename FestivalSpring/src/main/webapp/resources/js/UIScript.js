$(function () {
	$(document).on('click',"#hiddenBtn",function(){
	    $("#sub_wrap").addClass('hidden');
	});
	
	$(document).on('click',".item",function(){
		$("#sub_wrap").removeClass('hidden');
	});
	
	$('#dateSearch').click(function(){
		$("#nameSearch").removeClass('searchListClick');
		$("#nameOption").addClass('optionHidden');
		
		$("#dateSearch").addClass('searchListClick');
		$("#dateOption").removeClass('optionHidden');
		
		$("#keyword").val("");
		
		$(".areacode").val("");
		$(".sigunguCode").val("");
	});
	
	$('#nameSearch').click(function(){
		$("#dateSearch").removeClass('searchListClick');
		$("#dateOption").addClass('optionHidden');
		
		$("#nameSearch").addClass('searchListClick');
		$("#nameOption").removeClass('optionHidden');
		
		
		$(".areacode").val("");
		$(".sigunguCode").val("");
	});
	
	$('#sub_detail_view').click(function(){
		$("#sub_image_view").removeClass('subListClick');
		$("#sub_detail_view").addClass('subListClick');
	});
	
	$('#sub_image_view').click(function(){
		$("#sub_image_view").addClass('subListClick');
		$("#sub_detail_view").removeClass('subListClick');
	});
	
});
