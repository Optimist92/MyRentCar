<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<u:page title="" css="/resources/css/login.css">
    <c:url var="regUrl" value="/registration"/>
    <div class="wrapper">
        <div class="loginform">
            <form:form method="POST" modelAttribute="userForm">
                <div class="title">
                    Регистрация
                </div>
                <div class="input-form username">
                    <form:input type="text" path="username" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                        ${usernameError}
                    <i class="fas fa-user"></i>
                </div>
                <div class="input-form password">
                    <form:input type="password" path="password" placeholder="Password"></form:input>
                    <i class="fas fa-key"></i>
                </div>
                <div class="input-form password">
                    <form:input type="password" path="passwordConfirm"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="password"></form:errors>
                        ${passwordError}
                    <i class="fas fa-key"></i>
                </div>

                <div class="regis">
                    <a href="/">Главная   </a>
                </div>
                <div class="btn">
                    <input class="sub" id="submit" value="Зарегистрироваться" type="submit">
                </div>
            </form:form>
        </div>
    </div>
</u:page>