// ready v.s onload
// window.onload:
// 整個網頁下載完成後觸發。 因此如果網頁中包含圖檔，則事件觸發的時間會比較晚。
// $(document).ready
// 全部的DOM元素下載完成後觸發。 因為不需等待圖檔載入完成，因此事件觸發的時間較早。

// onload
// ex
function test()
{
    alert("test");
}
window.onload = test;

//
// ex
function test()
{
    alert("test");
}

function addLoadEvent(func) { 
	  var oldonload = window.onload; 
	  if (typeof window.onload != 'function') { 
	    window.onload = func; 
	  } else { 
	    window.onload = function() { 
	      if (oldonload) { 
	        oldonload(); 
	      } 
	      func(); 
	    } 
	  } 
} 

addLoadEvent(test);


// ready
// ex
$(document).ready(function() {
    alert('hello');
});

// shortcut version for ready
$(function() { alert('hello'); });








