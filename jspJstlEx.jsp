JSP Standard Tag Library 



<c:forEach var="netInfo" items="${netInfo}">
    <c:choose>
        <c:when test="${netInfo.type == 'IPv4'}">
            <td class="t_content_td"><c:out value="${netInfo.showName}"></c:out></td>
        </c:when>
        <c:otherwise>
            <td class="t_content_td"><c:out value="${netInfo.showName}"></c:out>(V6)</td>
        </c:otherwise>
    </c:choose>
</c:forEach>