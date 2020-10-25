<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<c:choose>
	<c:when test="${not empty car}">
		<c:set var="title" value="Редактирование автомобиля &laquo;${car.model.brandCar} ${car.model.modelCar}&raquo;"/>
	</c:when>
	<c:otherwise>
		<c:set var="title" value="Добавление нового автомобиля"/>
		<jsp:useBean id="car" class="net.xupypr.myrentcar.domain.Car"/>
	</c:otherwise>
</c:choose>

<u:page title="${title}" mainMenu="true" css="/resources/css/table.css">
	<c:url var="saveUrl" value="/cars/save"/>
	<form action="${saveUrl}" method="post" class="form">
		<c:if test="${not empty car.id}">
			<input type="hidden" name="id" value="${car.id}">
		</c:if>
		<label class="form__label" for="carModel">Класс авто:</label>
		<select class="form__text-input" id="carModel" name="carModel">
			<c:forEach var="carModel" items="${carModels}">
				<c:choose>
					<c:when test="${carModel.id == car.model.id}">
						<c:set var="selected" value="selected"/>
					</c:when>
					<c:otherwise>
						<c:remove var="selected"/>
					</c:otherwise>
				</c:choose>
				<option value="${carModel.id}" ${selected}>${carModel.brandCar} ${carModel.modelCar} ${carModel.yearsOfProduction} гг.</option>
			</c:forEach>
		</select>
		<br>
		<br>
		<label class="form__label" for="regNumberAuto">Регистрационный номер:</label>
		<input class="form__text-input" type="text" id="regNumberAuto" name="regNumberAuto" value="${car.regNumberAuto}">
		<br>
		<br>
		<label class="form__label" for="yearOfIssue">Год выпуска:</label>
		<input class="form__text-input" type="text" id="yearOfIssue" name="yearOfIssue" value="${car.yearOfIssue}">
		<br>
		<br>
		<label class="form__label" for="color">Цвет автомобиля:</label>
		<input class="form__text-input" type="text" id="color" name="color" value="${car.color}">
		<br>
		<br>
		<label class="form__label" for="airCond">Кондиционер:</label>
		<c:choose><c:when test="${car.airCond}">
			<input type="checkbox" id="airCond" name="airCond" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="airCond" name="airCond" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="powerWindows">Полный элетропакет:</label>
		<c:choose><c:when test="${car.powerWindows}">
			<input type="checkbox" id="powerWindows" name="powerWindows" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="powerWindows" name="airCond" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="seatHeating">Подогрев сидений:</label>
		<c:choose><c:when test="${car.seatHeating}">
			<input type="checkbox" id="seatHeating" name="seatHeating" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="seatHeating" name="seatHeating" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="wheelHeating">Подогрев руля:</label>
		<c:choose><c:when test="${car.wheelHeating}">
			<input type="checkbox" id="wheelHeating" name="wheelHeating" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="wheelHeating" name="wheelHeating" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="parkingSensors">Парктроник:</label>
		<c:choose><c:when test="${car.parkingSensors}">
			<input type="checkbox" id="parkingSensors" name="parkingSensors" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="parkingSensors" name="parkingSensors" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="cruiseControl">Круиз-контроль:</label>
		<c:choose><c:when test="${car.cruiseControl}">
			<input type="checkbox" id="cruiseControl" name="cruiseControl" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="cruiseControl" name="cruiseControl" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="media">CD/MP3/USB:</label>
		<c:choose><c:when test="${car.media}">
			<input type="checkbox" id="media" name="media" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="media" name="media" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="bluetooth">Bluetooth:</label>
		<c:choose><c:when test="${car.bluetooth}">
			<input type="checkbox" id="bluetooth" name="bluetooth" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="bluetooth" name="airCond" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<label class="form__label" for="leather">Кожанный салон:</label>
		<c:choose><c:when test="${car.leather}">
			<input type="checkbox" id="airCond" name="leather" checked="checked" value="true"/>
		</c:when>
			<c:otherwise>
				<input type="checkbox" id="leather" name="leather" value="true"/>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<button class="form_button" type="submit">Сохранить</button>
		<c:url var="listUrl" value="/cars/list"/>
		<div class="form_button_danger" ><a href="${listUrl}">Отмена</a></div>
	</form>
</u:page>