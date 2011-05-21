/*
    onmouseout & onmouseover
*/
<img src="image_w3default.gif" onmouseout="alert('mouse out')" onmouseover="alert('mouse over')" />  


/*
    get fochs & lose focus
*/
<input type="text" id="ipDiv1"  onFocus="checkip(this.value)"/>
<input type="text" id="ipDiv2"  onblur="checkip(this.value)"/>

/*
    click
*/
<input name="test" type="radio" onClick="check()">