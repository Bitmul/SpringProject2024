<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<jsp:include page="./layout/header.jsp"></jsp:include>
<jsp:include page="./layout/nav.jsp"></jsp:include>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	
	<a href="/board/register"><button>register</button></a>
<jsp:include page="./layout/footer.jsp"></jsp:include>