// jQuery = $

//select element by tag:
//ex:
$('tr')

// select all span elements inside of p elements, which are themselves inside div 
// elements but only if those divs happen to have a class of fancy
//ex:
$('div.fancy p span')

// select element by id
$('#test')

// select element by class name
$('.test')

// select element by name
$('input[name="rad1"]').attr('checked');  

// use checked filter to find checked element's value
$('input[name="rad1"]:checked').val(); 

// modify css
// ex
$('#btn2').css('background', 'url("../image/btn_center_grey.gif")' );

// get css 
$("p").css("color"); 
$('#btn').css('background-image');

// modify element's class
$("#test").attr('class', 'newClass');