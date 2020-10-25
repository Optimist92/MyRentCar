<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>


<c:set var="title" value="Добро пожаловать в личный кабинет, ${client.name} ${client.surname}"/>

<u:page title="${title}" mainMenu="true" css="/resources/css/table.css">
    <c:url var="saveUrl" value="/client/save"/>
    <form action="${saveUrl}" method="post" class="form">
        <c:if test="${not empty client.id}">
            <input type="hidden" name="id" value="${client.id}">
        </c:if>
        <label class="form__label" for="name">Имя:</label>
        <input class="form__text-input" type="text" id="name" name="name" value="${client.name}">
        <br>
        <br>
        <label class="form__label" for="surname">Фамилия:</label>
        <input class="form__text-input" type="text" id="surname" name="surname" value="${client.surname}">
        <br>
        <br>
        <label class="form__label" for="email">Email:</label>
        <input class="form__text-input" type="text" id="email" name="email" value="${client.email}">
        <br>
        <br>
        <label class="form__label" for="address">Адрес:</label>
        <input class="form__text-input" type="text" id="address" name="address" value="${client.address}">
        <br>
        <br>
        <label class="form__label" for="passport">Номер паспорта:</label>
        <input class="form__text-input" type="text" id="passport" name="passport" value="${client.passport}">
        <br>
        <br>
        <label class="form__label" for="birthday">Дата рождения:</label>
        <input class="form__text-input" type="text" id="birthday" name="birthday" placeholder="01.01.1970" value="<fmt:formatDate value="${client.birthday}" pattern="dd.MM.yyyy"/>">
        <br>
        <br>
        <label class="form__label" for="phone">Номер телефона:</label>
        <input class="form__text-input" type="text" id="phone" name="phone" value="${client.phone}">
        <br>
        <br>
        <label class="form__label" for="driver_lic_number">Номер водительского удостоверения</label>
        <input class="form__text-input" type="text" id="driver_lic_number" name="driver_lic_number" value="${client.driverLicNumber}">
        <br>
        <br>
        <button class="form_button" type="submit">Сохранить</button>
        <c:url var="listUrl" value="/cars/list"/>
        <div class="form_button_danger" ><a href="${listUrl}">Отмена</a></div>
    </form>
</u:page>
