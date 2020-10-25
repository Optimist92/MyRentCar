<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<u:page title="Редактирование пользователей" mainMenu="true" css="/resources/css/table.css">
    <div class="tables">
        <table>
            <thead>
            <th>ID</th>
            <th>UserName</th>
            <th>Password</th>
            <th>Roles</th>
            </thead>
            <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>
                        <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/admin" method="post">
                            <input type="hidden" name="userId" value="${user.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button class="form_button_danger" type="submit">Удалить</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</u:page>