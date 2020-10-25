<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<u:page title="Список завершённых заказов" mainMenu="true" css="/resources/css/table.css">
    <div class="tables">
        <table>
            <tr>
                <th>Намер заказа</th>
                <th>Марка авто</th>
                <th>Рег номер</th>
                <th>Цвет</th>
                <th>Год выпуска</th>
                <th>Дата заказа</th>
                <th>Планируемая дата возврата</th>
                <th>Цена</th>
                <th>Статус заказа</th>
            </tr>
            <c:forEach var="order" items="${ordersList}" >
                <tr>
                    <td>${order.id}</td>
                    <td>${order.car.model.brandCar} ${order.car.model.modelCar}</td>
                    <td>${order.car.regNumberAuto}</td>
                    <td>${order.car.color}</td>
                    <td>${order.car.yearOfIssue}</td>
                    <td><fmt:formatDate value="${order.dateOrder}" pattern="dd.MM.yyyy"/></td>
                    <td><fmt:formatDate value="${order.planDateEnd}" pattern="dd.MM.yyyy"/></td>
                    <td>${order.price}</td>
                    <td>${order.statusOrder.name}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</u:page>