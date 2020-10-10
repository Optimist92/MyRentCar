<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>


<html>
<head>
    <title>Prices</title>
</head>
<body>
</form>
<br>
<table>
    <tr>
        <th>ID</th>
        <th>Цена за 1-3 дня</th>
        <th>Цена за 4-7 дней</th>
        <th>Цена за 8 и более дней</th>
    </tr>
    <c:forEach var="price" items="${priceList}">
        <tr>
            <td>${note.id}</td>
            <td>${price.cost1}</td>
            <td>${price.cost4}</td>
            <td>${price.cost8}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
