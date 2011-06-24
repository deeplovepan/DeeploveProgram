EL:
Expression Language


<% foo.Person p = (foo. Person) request.getAttribute(“person”) ; %>
Person is: <%= p.getName() %>

<jsp:useBean id=”person”  class=”foo.Person” scope=”request” />
Person created by servlet: <jsp:getProperty name=”person”  property=”name” />

<jsp:setProperty name=”person” property=”name” value=”Fred” />


<jsp:useBean id=”person” type=”foo.Person” class=”foo.Employee”> 
    <jsp: setProperty name=”person” property=”name” param=”userName” />
</jsp:useBean>

<!-- 
if request parameter name matches bean property name, you don't
need to specify param
-->
<jsp:useBean id=”person” type=”foo.Person” class=”foo.Employee”> 
     <jsp:setProperty name=”person” property=”name”  />
</jsp:useBean>

<!--
  set petson for all matched parameter name
-->
<jsp:setProperty name=”person” property=”*” />

<%=  ((foo. Person) request. getAttribute(“person”) ) . getDog() . getName() %>
->
<jsp:useBean id=”person”  class=”foo.Person” scope=”request” />
${person.dog.name}

First food is ${favoriteFood[0] }
or
First food is ${favoriteFood["0"] }


${musicMap. Ambient}  
=
${ musicMap[“Ambient”] } 


 ${param. name} 

${ pageContext. request. method}

