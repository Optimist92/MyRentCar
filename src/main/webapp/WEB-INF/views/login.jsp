<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<u:page title="" css="/resources/css/login.css">
    <c:url var="loginUrl" value="/login"/>
<div class="wrapper">
    <div class="loginform">
        <form action="${loginUrl}" id="autoriz" method="post">
            <div class="title">
                Авторизация
            </div>
            <span>${error}</span>
        <div class="input-form username">
            <input class="input" id="username" name="username" placeholder="Username" autofocus="true" required="" type="text">
            <i class="fas fa-user"></i>
        </div>
        <div class="input-form password">
            <input type="password" class="input" id="password" name="password" placeholder="Password" required="">
            <i class="fas fa-key"></i>
        </div>
        <div class="regis">
            <a href="/registration">Регистрация</a>
        </div>
        <div class="btn">
            <input class="sub" id="submit" value="Войти" type="submit">
        </div>
        </form>
    </div>
</div>
</u:page>