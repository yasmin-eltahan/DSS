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

$(function(){
 $("#criteria-search input").keyup(function (){
    $.get($("#criteria-search").attr("action"), $("#criteria-search").serialize(), null, "script");
    return false;
  });
});

$(function(){
 $("#spec-search input").keyup(function (){
    $.get($("#spec-search").attr("action"), $("#spec-search").serialize(), null, "script");
    return false;
  });
});

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
    var v= ""
    var c = $(this).val()
    $('#'+c).slideUp();
    $('#'+c).find('input[type=text]').val(v);
    $('#'+c).find('input[type=checkbox]:checked').removeAttr('checked');
    $('.save').attr("disabled", true);
  }
});
});

$ (function(){
$(".all").click(function(){
  if($(this).is(':checked')){
  var c = $(this).attr('id')
  $('#'+c).find('input[type=checkbox]').prop("checked", true);
  
  }
  else{
    $('#'+c).find('input[type=checkbox]:checked').removeAttr('checked');
  }
});
});

$ (function(){
$('.subw').keyup(function(){
  var n = $(this).attr('id')
  var v = $('#'+n).text();
  var vint = parseInt(v);
  var sum= 0; 
  $('#sub'+n).find('input.subw[type=text]').each(function(){
    sum += Number($(this).val());
  });

  if (sum == vint){
    $('.save').removeAttr("disabled");
  }
  else{
    $('.save').attr("disabled", true);
  }
});
});


$ (function () {
var sum= 0; 
$('.weight').keyup(function(){
  sum= 0; 
  $('.weight').each(function() {
    sum += Number($(this).val());
  });
  if (sum == 100){
    $('.save').removeAttr("disabled");
  }
  else{
    $('.save').attr("disabled", true);
  }
});
});


$ (function(){
  var max = "";
$('.drop').change(function(){
 max = $(this).val()
 var select = $(this).attr('id');
 $('#'+select).find('input[type="hidden"]').val(max);
});
});