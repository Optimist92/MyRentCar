<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<u:page title="Список автомобилей" mainMenu="true" css="/resources/css/table.css">
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
						<th>Подогрев руля</th>
						<th>Парктроник</th>
						<th>Круиз-контроль</th>
						<th>CD/MP3/USB</th>
						<th>Bluetooth</th>
						<th>Кожанный салон</th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach var="car" items="${carsList}">
						<tr>
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
							<c:url var="editUrl" value="/cars/edit">
								<c:param name="id" value="${car.id}"/>
							</c:url>
							<td><a href="${editUrl}" class="form_button_edit">Edit</a></td>
							<td>
								<form action="${pageContext.request.contextPath}/cars/delete" method="post">
									<input type="hidden" name="carId" value="${car.id}"/>
									<button type="submit" class="form_button_danger">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				<c:url var="editUrl" value="/cars/edit"/>
				<a href="${editUrl}" class="form_button">Add new car</a>
				<c:url var="modList" value="/models/list"/>
				<a href="${modList}" class="form_button_edit">Models</a>
			</div>
</u:page>
