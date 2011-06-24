// jQuery = $

//select element by tag:
//ex:
$('tr')

// select all elements matched by “B” that are child, grandchild, great-grandchild, great-great-grandchild..(any levels deep) of a “A” element.
$("#a div").css("border", "2px solid red");

// select element by id
$('#test')

// select element by tag & id
$('div#test')

// select element by class name
$('.test')

// select element by tag & class name
$('div.test')

// select #a and #b 
$('#a, #b')

//  Adjacent sibling selector (A + B) select the immediately follow or next elements matched by “B” that is a sibling of a “A” element.
$(".test + p").css("border", "2px solid red");

//  general sibling selector (X ~ Y) is used to select all elements matched by “Y” that is a sibling of a “X” element.
$(.test ~ p)

// get tag name
$('#idTag1')[0].tagName; 
->
'DIV'

// child selector 
// selects all elements matched by <tr> that are the third child of their parent.
$(‘tr:nth-child(3)’) 
// selects all elements matched by <tr> that are every third child of their parent.
$(‘tr:nth-child(3n)’) 
// selects all elements matched by <tr> that are the even child of their parent.
$(‘tr:nth-child(even)’)  
// selects all elements matched by <li> that are the first child of their parent.
$(‘li:first-child’)  
// selects all elements matched by <li> that are the last child of their parent.
$(‘li:last-child’)  

// not selector
// selects all elements matched by <li> that are NOT the first child of their parent
$('li:not(:first-child)') 

// parent selector
$('td').parent();

// parents selector
// search through the ancestors of these elements in the DOM tree and construct a new jQuery object from the matching elements ordered from immediate parent on up; the elements are returned in order from the closest parent to the outer ones
$('td').parents();

// Contains selector 
// selects all elements matched by <li> that contains the text "three"
$('li:contains(three)') 

// select element by tag attribute
$('a[rel]')

// select element by name
$('input[name="rad1"]').attr('checked');  

// use checked filter to find checked element's value
$('input[name="rad1"]:checked').val(); 

// select element by value
$('input[value="allFiles"]')

// select element inside another element
$("div > div")

// select text
$('input:text');

// select radio button
$('input:radio');

// get the size of matched element
$("div").size()

// get specific element 
$('#test').eq(0);

// find
// search through all the descendants(child, grandchild, great-grandchild…any levels deep) of the matched element.
$('#test').find('td')

// filter
// extract your elements from a set of the matched elements
$("div").filter("#div1").css('background-color', 'blue');
$('div').filter(function(index) {
	if(index==2 || index==3){ //0 index based
		return true;
	}
}).css('background-color', 'blue');

// filter v.s find
// filter() – search through all the elements.
// find() – search through all the child elements only.

// next
// get the immediate following sibling element in the set of matched elements
$('div').next();
$('div').next('.test');

// prev
// get the immediate preceding sibling element in the set of matched elements
$('div').prev();
$('div').prev('.test');

// children
// find the child of the matched elements, it’s only travels a single level down
$('.A1').children('.child').css('background','red');

// check if matched element exist
if($('#div1').length)
{
    alert('div1 exist');
}

# loop through each element of the target jQuery object
$('div').each(function() {
    alert($(this).text());
});


// modify css
// ex
$('#btn2').css('background', 'url("../image/btn_center_grey.gif")' );

// get css 
$("p").css("color"); 
$('#btn').css('background-image');

// modify element's class
$("#test").attr('class', 'newClass');


// before() and insertBefore()
// add a text or html content before the matched elements
$('.prettyBox').before("<div class='newPrettybox'>Iron man</div>");

// after() and insertAfter() 
// add a text or html content after the matched elements
$('.greyBox').after("<div class='redBox'>Iron man</div>");

// prepend() and prependTo() 
// add a text or html content before the content of the matched elements
$('.box').prepend("<div class='newbox'>I'm new box by prepend</div>");

// append() and appendTo() 
// add a text or html content after the content of the matched elements
$('.box').append("<div class='newbox'>I'm new box by prepend</div>");

// clone
//  create a copy of the matched elements. It also support a boolean parameter to indicate whether need to copy the event handlers and data along with the matched elements.
$('.smallBox').clone().insertAfter(".smallBox");

// empty & remove
//  empty() and remove() are used to remove the matched elements, just the former is used to remove the child of the matched elements; while the latter is used to remove all the matched elements totally.
$('.ABox').empty();
$('.ABox').remove();

// toggleClass
//  if matched elements do not have the class name, then add it; if matched elements already have the class name, then remove it.
$('p').toggleClass('highlight')

// wrap
// wrap HTML element around each of the matched elements
$('.innerBox').wrap("<div class='wrapBox'></div>");




