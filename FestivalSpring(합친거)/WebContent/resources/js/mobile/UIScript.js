$(function () {
	$(document).on('click',"#hiddenBtn",function(){
		$("#sub_wrap").addClass('displayNone');
		
		$("#festival-list").removeClass('displayNone');
	});
	
	$('#searchExit').click(function(){
		$(".map_wrap").removeClass('displayNone');
		
		$("#serach-gonggan").addClass('displayNone');
	});
	
	$('#listExit').click(function(){
		$("#festival-list").addClass('displayNone');
		var height=$("body").height()-130;
		$("#map_size_wrap").height(height);
		relayOut();
	});
	
	$('.searchList').click(function(){
		$(".map_wrap").addClass('displayNone');
		$("#serach-gonggan").removeClass('displayNone');
	});
	
	$('#dateSearch, #datePageBtn').click(function(){
		
		clickSearchBtn();
		$("#nameSearch").removeClass('searchListClick');
		$("#nameOption").addClass('displayNone');
		
		$("#dateSearch").addClass('searchListClick');
		$("#dateOption").removeClass('displayNone');
		
		$("#sub_wrap").addClass('displayNone');
		
		$("#keyword").val("");
		
		$(".areacode").val("");
		$(".sigunguCode").val("");
	});
		
	$('#nameSearch, #namePageBtn').click(function(){


		clickSearchBtn();
		$("#dateSearch").removeClass('searchListClick');
		$("#dateOption").addClass('displayNone');
		
		$("#nameSearch").addClass('searchListClick');
		$("#nameOption").removeClass('displayNone');
		
		$("#sub_wrap").addClass('displayNone');
		
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
	
	$('#placesList').click(function(){
		$("#festival-list").addClass('displayNone');
		$("#sub_wrap").removeClass('displayNone');
	});
	
	function clickSearchBtn(){
					
		$('#dateSearchBtn, #nameSearchBtn').click(function(){
		var whatSearch = $(this).attr('id'); 
		if(whatSearch=="nameSearchBtn")
		{
			var keyword = $("#keyword").val();
			if(keyword!="")
			{
				$("#map_size_wrap").height('200');
				$("#serach-gonggan").addClass('displayNone');
				$(".map_wrap").removeClass('displayNone');
				$("#festival-list").removeClass('displayNone');
			}
		}
		else
		{
			$("#map_size_wrap").height('200');
			$("#serach-gonggan").addClass('displayNone');
			$(".map_wrap").removeClass('displayNone');
			$("#festival-list").removeClass('displayNone');
			
		}
		});
	}
});
