send ajax get:
ex:
sendAjaxGet("http://localhost/hello.php?name=peter&age=22");
sendAjaxGet("hello.txt");

function sendAjaxGet(path, action)
{
    var ajaxRequest;
    try
    {
        ajaxRequest = new XMLHttpRequest();
        
        // true means async, false means sync
        ajaxRequest.open("GET", path, true);
        
        ajaxRequest.send(null);
    }
    catch(ex)
    {
        
    }
}

send ajax post:
ex:
sendAjaxPost("http://localhost/hello.php", "name=peter&age=22");

function sendAjaxPost(path, postContent)
{
    var ajaxRequest;
    try
    {
        ajaxRequest = new XMLHttpRequest();
        
        // true means async, false means sync
        ajaxRequest.open("POST", path, true);
        ajaxRequest.setRequestHeader("Content-type", 
           "application/x-www-form-urlencoded");
        ajaxRequest.onreadystatechange = function() 
        {
            
            // complete
            if(ajaxRequest.readyState == 4)
            {
                // HTTP status 200 OK
                if(ajaxRequest.status == 200)
                {
                    // get response from responseText
                    alert(ajaxRequest.responseText);
                    
                    // get response from responseXML
                    // alert(ajaxRequest.responseXML);
                    
                    // getAllResponseHeaders(): get HTTP response headers 
                    headers=ajaxRequest.getAllResponseHeaders();
                    alert(headers);
                    
                    // getResponseHeader: get specific HTTP response header
                    alert(ajaxRequest.getResponseHeader("Content-type");
                    
                }

            }
           
        }
        
        ajaxRequest.send(postContent);
    }
    catch(ex)
    {
        
    }
}
                          
                          
// use jquery to send sync ajax
$.ajax({
       url:'../servlet/test',
       type:'post',
       dataType:'json',
       async:false,
       success:myCallBack		
});

