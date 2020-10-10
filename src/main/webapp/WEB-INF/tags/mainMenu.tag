<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="css" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:url var="carsList" value="/cars/list"/>
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
		<c:if test="${sessionUser.role == 'MANAGER'}">
			<li><a href="${carsList}">Таблицы</a></li>
		</c:if>
		<c:if test="${sessionUser.role == 'OPERATOR'}">
			<li><a href="#">Заказы</a></li>
		</c:if>
	</ul>
</div>
