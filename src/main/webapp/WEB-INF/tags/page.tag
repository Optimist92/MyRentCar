<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="css" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="mainMenu" required="false" rtexprvalue="true" type="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Rent Car
			<c:if test="${not empty title}">:: ${title}</c:if>
		</title>
		<c:url var="mainCssUrl" value="/resources/css/main.css"/>
		<link rel="stylesheet" href="${mainCssUrl}" type="text/css">
		<c:if test="${not empty css}">
			<c:url var="cssAdd" value="${css}"/>
			<link rel="stylesheet" href="${cssAdd}" type="text/css">
		</c:if>
		<link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@400;700&family=Balsamiq+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Caveat:wght@400;700&family=Lobster&family=Marck+Script&family=Neucha&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Oswald:wght@200;300;400;500;600;700&family=Pacifico&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Yanone+Kaffeesatz:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
		<c:url var="searchJsonUrl" value="/searchCars"/>
		<script type="text/javascript">
			var searchUrl = '${searchJsonUrl}';
		</script>
		<c:url var="searchJsUrl" value="/resources/js/dynamic-search.js"/>
		<script type="text/javascript" src="${searchJsUrl}"></script>
		<c:url var="ddjs" value="/resources/js/droplist.js"/>
		<script type="text/javascript" src="${ddjs}"></script>
	</head>
	<body>
	<div class="wrapper">
		<div class="content">
		<header>
			<div class="header-up">
				<div class="header-left">
					<c:url var="start" value="/"/>
					<a href="${start}" class="logo">
						<c:url var="logo" value="/resources/images/logo.png"/>
			            <img src="${logo}" alt="На главную" title="На главную" width="300" height="50">
					</a>
				</div>
				<div class="header-center">
					<div class="address">
						<div class="address_img">
							<c:url var="address_img" value="/resources/images/compass.png"/>
							<img src="${address_img}" alt="Адрес" width="40" height="40">
						</div>
						<div>
	                		<a href="https://yandex.by/maps/154/vitebsk/house/Z0kYdARlT0MAQFtvfX10eXlmYQ==/?ll=30.235666%2C55.158555&utm_medium=mapframe&utm_source=maps&z=16">Витебск<br> ул.Петруся Бровки д.50</a>
	                    </div>
	                </div>
	                <div class="clock">
	                	<div class="clock_img">
	                		<c:url var="clock_img" value="/resources/images/clock.png"/>
	                		<img src="${clock_img}" alt="Время работы" width="40" height="40">
	                	</div>
	                	<p>Часы работы:<br>10:00 - 20:00</p>
	                </div>
					<div class="mob_number">
						<div class="mob_img">
							<c:url var="mob_img" value="/resources/images/mobile.png"/>
							<img src="${mob_img}" alt="Телефон" width="40" height="40">
						</div>
						<div class="mob_info">
							<div class="label">
								<strong>Tel. / Viber</strong>
							</div>
			            	<div class="phone">
			            		<a href="tel:+375298225566"> +375(29)822-55-66</a>
							</div>
						</div>
					</div>
				</div>
				<div class="header-right">
					<sec:authorize access="!isAuthenticated()">
						<c:url var="loginUrl" value="/login"/>
						<div class="login_button"><a class="logbut" href="${loginUrl}">Войти</a></div>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
						<c:url var="logoutUrl" value="/logout"/>
						<div class="userlist"><a class="logbut" href="${logoutUrl}">${pageContext.request.userPrincipal.name}  Выйти</a></div>
					</sec:authorize>
					<sec:authorize access="hasRole('USER')">
						<c:url var="logoutUrl" value="/logout"/>
						<c:url var="orderList" value="/orders/list"/>
						<c:url var="accountEdit" value="/client/account"/>
						<div class="userlist">
							<div class="username">${pageContext.request.userPrincipal.name}</div>
							<div class="usermenu">
								<a class="logbut" href="${orderList}">Заказы</a>
								<a class="logbut" href="${accountEdit}">Личные данные</a>
								<a class="logbut" href="${logoutUrl}">Выйти</a>
							</div>
						</div>
					</sec:authorize>
					<sec:authorize access="hasRole('OPERATOR')">
						<c:url var="order1" value="/orders/stat/list1"/>
						<c:url var="order2" value="/orders/stat/list2"/>
						<c:url var="order3" value="/orders/stat/list3"/>
						<c:url var="logoutUrl" value="/logout"/>
						<div class="userlist">
							<div class="username">${pageContext.request.userPrincipal.name}</div>
							<div class="usermenu">
								<a class="logbut" href="${order1}">Заказы на обработку</a>
								<a class="logbut" href="${order2}">Оформленные заказы</a>
								<a class="logbut" href="${order3}">Завершённые заказы</a>
								<a class="logbut" href="${logoutUrl}">Выйти</a>
							</div>
						</div>
					</sec:authorize>
					<c:url var="searchUrl" value="${pageContext.request.contextPath}/search"/>
					<form action="${searchUrl}" class="search_form">
					    <div class="search-form">
						     <input id="search-text" type="search" placeholder="поиск по автомобилям" name="query" list="search-text-datalist" autocomplete="off">
							 <datalist id="search-text-datalist"></datalist>
						     <input class="search" type="submit" value="">
					    </div>
				    </form>
				</div>
			</div>
			<c:if test="${not empty mainMenu}">
				<u:mainMenu/>
			</c:if>
		</header>

		<c:if test="${not empty title}"><h1 class="titles">${title}</h1></c:if>
		<jsp:doBody/>
		</div>
		<footer>
			<div class="contact_footer">
				<div class="contact-label">Свяжитесь с нами</div>
				<div class="contact">
					<a class="contact_phone" href="tel:+375(29)822-55-66">+375(29)822-55-66</a>
					<a class="contact_social" href="https://www.linkedin.com/in/eugene-borodin1b25b81b4/">
						<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Linkedin.svg/1200px-Linkedin.svg.png"
							 alt="linkedin" height="20" width="20" />
					</a>
				</div>
				<div class="author">Made by Eugene Borodin</div>
			</div>
		</footer>
	</div>
	</body>
</html>