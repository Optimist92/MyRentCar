<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<u:page title="Список автомобилей" mainMenu="true" css="/resources/css/table.css">
	<c:url var="newOrdUrl" value="/orders/new"/>
			<div class="tables">
				<table>
					<tr>
						<th>Марка авто</th>
						<th>Рег номер</th>
						<th>Цвет</th>
						<th>Год выпуска</th>
						<th>Кондиционер</th>
						<th>Электропакет</th>
						<th>Подогрев сидений</th>
						<th>Обогрев зеркал</th>
						<th>Парктроник</th>
						<th>Круиз-контроль</th>
						<th>CD/MP3/USB</th>
						<th>Bluetooth</th>
						<th>Кожанный салон</th>
						<th></th>
					</tr>
					<c:forEach var="car" items="${carsList}" >
						<tr>
							<form action="${newOrdUrl}" method="get" class="tables">
							<input type="text" hidden name="id" value="${car.id}">
							<td>${car.model.brandCar} ${car.model.modelCar}</td>
							<td>${car.regNumberAuto}</td>
							<td>${car.color}</td>
							<td>${car.yearOfIssue}</td>
							<td><c:choose><c:when test="${car.airCond}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.powerWindows}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.seatHeating}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.wheelHeating}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.parkingSensors}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.cruiseControl}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.media}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.bluetooth}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<td><c:choose><c:when test="${car.leather}">Есть</c:when>
								<c:otherwise>Нет</c:otherwise></c:choose></td>
							<c:url var="newOrderUrl" value="/orders/new">
								<c:param name="id" value="${car.id}"/>
							</c:url>
							<td><button type="submit" class="form_button">Заказать</button></td>
							</form>
						</tr>
					</c:forEach>
				</table>
			</div>
</u:page>
