<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<c:choose>
	<c:when test="${not empty carModel}">
		<c:set var="title" value="Редактирование модели &laquo;${carModel.brandCar} ${carModel.modelCar}&raquo;"/>
	</c:when>
	<c:otherwise>
		<c:set var="title" value="Добавление новой модели"/>
		<jsp:useBean id="model" class="net.xupypr.myrentcar.domain.CarModel"/>
	</c:otherwise>
</c:choose>

<u:page title="${title}" mainMenu="true" css="/resources/css/table.css">
			<c:url var="saveUrl" value="/models/save"/>
			<form action="${saveUrl}" method="post" class="form">
				<c:if test="${not empty carModel.id}">
					<input type="hidden" name="id" value="${carModel.id}">
				</c:if>
				<label class="form__label" for="carClass">Класс авто:</label>
				<select class="form__text-input" id="carClass" name="carClass">
					<c:forEach var="carClass" items="${carClasses}">
						<c:choose>
							<c:when test="${carClass.id == carModel.carClass.id}">
								<c:set var="selected" value="selected"/>
							</c:when>
							<c:otherwise>
								<c:remove var="selected"/>
							</c:otherwise>
						</c:choose>
						<option value="${carClass.id}" ${selected}>${carClass.name}</option>
					</c:forEach>
				</select>
				<br>
				<br>
				<label class="form__label" for="brandCar">Название производителя:</label>
				<input class="form__text-input" type="text" id="brandCar" name="brandCar" value="${carModel.brandCar}">
				<br>
				<br>
				<label class="form__label" for="modelCar">Название модели:</label>
				<input class="form__text-input" type="text" id="modelCar" name="modelCar" value="${carModel.modelCar}">
				<br>
				<br>
				<label class="form__label" for="type">Тип авто:</label>
				<select class="form__text-input" id="type" name="type">
					<c:forEach var="type" items="${types}">
						<c:choose>
							<c:when test="${type.id == carModel.type.id}">
								<c:set var="selected" value="selected"/>
							</c:when>
							<c:otherwise>
								<c:remove var="selected"/>
							</c:otherwise>
						</c:choose>
						<option value="${type.id}" ${selected}>${type.name}</option>
					</c:forEach>
				</select>
				<br>
				<br>
				<label class="form__label" for="fuel">Тип топлива:</label>
				<select class="form__text-input" id="fuel" name="fuel">
					<c:forEach var="fuel" items="${fuels}">
						<c:choose>
							<c:when test="${fuel.id == carModel.fuel.id}">
								<c:set var="selected" value="selected"/>
							</c:when>
							<c:otherwise>
								<c:remove var="selected"/>
							</c:otherwise>
						</c:choose>
						<option value="${fuel.id}" ${selected}>${fuel.name}</option>
					</c:forEach>
				</select>
				<br>
				<br>
				<label class="form__label" for="transmission">Коробка передач:</label>
				<select class="form__text-input" id="transmission" name="transmission">
					<c:forEach var="transmission" items="${transmissions}">
						<c:choose>
							<c:when test="${transmission.id == carModel.transmission.id}">
								<c:set var="selected" value="selected"/>
							</c:when>
							<c:otherwise>
								<c:remove var="selected"/>
							</c:otherwise>
						</c:choose>
						<option value="${transmission.id}" ${selected}>${transmission.name}</option>
					</c:forEach>
				</select>
				<br>
				<br>
				<label class="form__label" for="avgFuelCons">Средний расход топлива:</label>
				<input class="form__text-input" type="text" id="avgFuelCons" name="avgFuelCons" value="${carModel.avgFuelCons}">
				<br>
				<br>
				<label class="form__label" for="power">Мощность:</label>
				<input class="form__text-input" type="text" id="power" name="power" value="${carModel.power}">
				<br>
				<br>
				<label class="form__label" for="capacity">Объём двигателя:</label>
				<input class="form__text-input" type="text" id="capacity" name="capacity" value="${carModel.capacity}">
				<br>
				<br>
				<label class="form__label" for="yearsOfProduction">Годы выпуска модели:</label>
				<input class="form__text-input" type="text" id="yearsOfProduction" name="yearsOfProduction" value="${carModel.yearsOfProduction}">
				<br>
				<br>
				<label class="form__label" for="cost1">1-3 дня</label>
				<input class="form__text-input" type="text" id="cost1" name="cost1" value="${carModel.price.cost1}">
				<br>
				<br>
				<label class="form__label" for="cost4">4-7 дня</label>
				<input class="form__text-input" type="text" id="cost4" name="cost4" value="${carModel.price.cost4}">
				<br>
				<br>
				<label class="form__label" for="cost8">Более 8 дней</label>
				<input class="form__text-input" type="text" id="cost8" name="cost8" value="${carModel.price.cost8}">
				<br>
				<br>
				<button class="form_button" type="submit">Сохранить</button>
				<br>
				<c:url var="listUrl" value="/models/list"/>
				<div class="form_button_danger" type="button" ><a class="form_button_danger" href="${listUrl}">Отмена</a></div>
			</form>
</u:page>
	
	


