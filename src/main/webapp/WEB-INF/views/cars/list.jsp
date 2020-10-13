<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<u:page title="Список автомобилей" mainMenu="true" css="/css/table.css">
	<c:choose>
		<c:when test="${sessionUser.role == 'MANAGER'}">
			<c:url var="deleteUrl" value="/cars/delete"/>
			<form action="${deleteUrl}" method="post" class="tables">
				<div class="listCars">
					<table>
						<tr>
							<th></th>
							<th>Марка авто</th>
							<th>Рег номер</th>
							<th>Цвет</th>
							<th></th>
						</tr>
						<c:forEach var="car" items="${carsList}" >
							<tr>
								<td><input type="checkbox" name="id" value="${car.id}"></td>
								<td>${car.model.brandCar} ${car.model.modelCar}</td>
								<td>${car.regNumberAuto}</td>
								<td>${car.color}</td>
								<c:url var="editUrl" value="/cars/edit">
									<c:param name="id" value="${car.id}"/>
								</c:url>
								<td><a href="${editUrl}" class="form_button_edit">Редактировать</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:url var="editUrl" value="/cars/edit"/>
					<a href="${editUrl}" class="form_button">Добавить</a>
					<button type="submit" class="form_button_danger">Удалить</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div class="tables">
				<table>
					<tr>
						<th>Марка авто</th>
						<th>Рег номер</th>
						<th>Цвет</th>
						<th></th>
					</tr>
					<c:forEach var="car" items="${carsList}">
						<tr>
							<td>${car.model.brandCar} ${car.model.modelCar}</td>
							<td>${car.regNumberAuto}</td>
							<td>${car.color}</td>
							<c:url var="newOrderUrl" value="/orders/edit">
								<c:param name="id" value="${car.id}"/>
							</c:url>
							<td><a href="${newOrderUrl}" class="form_button">Заказать</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</u:page>
