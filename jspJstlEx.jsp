JSP Standard Tag Library 


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!--
    jstl if 
-->
<c:set var="guess" value="12"/>
<c:if test="${(guess >= 10)  && (guess <= 20)}">
    <b>You're in range!</b><br/>
</c:if>

<!-- 
    jstl if else
-->
<c:choose>
    <c:when test="${param.enter == '1'}">pizza.
        <br />
    </c:when>

    <c:otherwise>pizzas.
        <br />
    </c:otherwise>
</c:choose>

<!--
    jstl for
-->
<c:forEach var="i" begin="1" end="10" step="1">
    <c:out value="${i}" />
    <br />
</c:forEach>


<!--
jstl for through list
-->
<%
// Create an ArrayList with test data
ArrayList list = new ArrayList();
Map author1 = new HashMap();
author1.put("name", "A");
author1.put("id", new Integer(1));
list.add(author1);
Map author2 = new HashMap();
author2.put("name", "B");
author2.put("id", new Integer(2));
list.add(author2);
Map author3 = new HashMap();
author3.put("name", "C");
author3.put("id", new Integer(3));
list.add(author3);
pageContext.setAttribute("authors", list);
%>

<html>
<head>
<title>Search result: Authors</title>
</head>
<body bgcolor="white">
Here are all authors matching your search critera:
<table>
<TH>Name</th>
<TH>Id</th>
<c:forEach items="${authors}" var="current">
    <tr>
    <td><c:out value="${current.name}" /><td>
    <td><c:out value="${current.id}" /><td>
    </tr>
</c:forEach>
</table>
</body>
</html>

<!-- 
    jstl function: string contain
-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(theString, 'test')}">
    <p>Found test string<p>
</c:if>

