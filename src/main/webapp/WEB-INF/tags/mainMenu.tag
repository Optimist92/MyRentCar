<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="css" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:url var="carsList" value="/cars/list"/>
<c:url var="admin" value="/admin"/>
<div class="header-down">
	<ul class="list">
		<li><a href="${carsList}">Автомобили</a></li>
		<li><a href="#">Условия проката</a></li>
		<li><a href="#">Тарифы</a></li>
		<li><a href="#">Скидки</a></li>
		<li><a href="#">О компании</a></li>
		<li><a href="#">Новости</a></li>
		<li><a href="#">Отзывы</a></li>
		<li><a href="#">Контакты</a></li>
		<sec:authorize access="hasRole('ADMIN')">
			<li><a href="${admin}">Администрирование</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('MANAGER')">
			<li><a href="${carsList}">Таблицы</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('OPERATOR')">
			<li><a href="#">Заказы</a></li>
		</sec:authorize>
	</ul>
</div>
