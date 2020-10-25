<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<u:page title="Вход в систему" css="/resources/css/login.css">
<div>
    <c:url var="loginUrl" value="/login"/>
    <form action="${loginUrl}" id="autoriz" method="post">
        <h1>Вход</h1>
        <fieldset id="inputs">
            <input id="username" name="username" placeholder="Логин" autofocus="true" required="" type="text">
            <input id="password" name="password" placeholder="Пароль" required="" type="password">
        </fieldset>
        <fieldset id="actions">
            <input id="submit" value="Войти" type="submit">
            <a href="">Забыли пароль?</a><a href="/registration">Регистрация</a>
        </fieldset>
    </form>
</div>
</u:page>