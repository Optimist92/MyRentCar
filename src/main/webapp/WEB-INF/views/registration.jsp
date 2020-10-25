<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<u:page title="" css="/resources/css/login.css">
    <div class="wrapper">
        <div class="loginform">
            <form:form method="POST" modelAttribute="userForm">
                <div class="title">
                    Регистрация
                </div>
                <div>
                        ${usernameError}
                </div>
                <div class="input-form username">
                    <form:input class="input" type="text" path="username" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                    <i class="fas fa-user"></i>
                </div>

                <div class="input-form password">
                    <form:input class="input" type="password" path="password" placeholder="Password"></form:input>
                    <i class="fas fa-key"></i>
                </div>
                <div>${passwordError}
                </div>
                <div class="input-form password">
                    <form:input class="input" type="password" path="passwordConfirm"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="password"></form:errors>
                    <i class="fas fa-key"></i>
                </div>

                <div class="lognew">
                    <a href="/login">Вход</a>
                </div>
                <div class="btn">
                    <input class="sub" id="submit" value="Зарегистрироваться" type="submit">
                </div>
            </form:form>
        </div>
    </div>
</u:page>