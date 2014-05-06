// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function(){
    $('.inner-content-div').slimScroll({
        height: '450px'
    });
});

$(function(){
 $("#Budget-serach input").keyup(function (){
    $.get($("#Budget-serach").attr("action"), $("#Budget-serach").serialize(), null, "script");
    return false;
  });
});

$(function(){
 $("#system-search input").keyup(function (){
    $.get($("#system-search").attr("action"), $("#system-search").serialize(), null, "script");
    return false;
  });
});


$(function(){
 $("#vendor-search input").keyup(function (){
    $.get($("#vendor-search").attr("action"), $("#vendor-search").serialize(), null, "script");
    return false;
  });
});

$(function(){
 $("#company-search input").keyup(function (){
    $.get($("#company-search").attr("action"), $("#company-search").serialize(), null, "script");
    return false;
  });
});





// $(function() {
//     $("#options").click(function(){
//         $("#req-div").toggle("slow");
//     });
// });


// $(".img-circle").css('opacity','0.4');



//    $(".box-list").hover(function() {
//        $(this).find(".img-circle").stop().animate({ opacity: 1 });
//    }, function() {
//       $(this).find(".img-circle").stop().animate({ opacity: 0.4 }); 
//    });








$(function(){
    $('.inner').slimScroll({
        height: '450px'
    });
});

$(function(){
    $('.inner2').slimScroll({
        height: '450px'
    });
});



$ (function(){
$(".cb").click(function(){
	if($(this).is(':checked')){
	var c = $(this).val()
	$('#'+c).slideDown();	
	
	}
	else{
		var c = $(this).val()
		$('#'+c).slideUp();
		$('#'+c).find('input[type=checkbox]:checked').removeAttr('checked');
	}
});
});

$ (function(){
var sum= 0; 
$('.weight').change(function(){
	sum= 0; 
  $('.weight').each(function() {
    sum += Number($(this).val());
  });
  $('#sum').val(sum);
});
});




