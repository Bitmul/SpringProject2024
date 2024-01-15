<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">email</th>
				<th scope="col">nickname</th>
				<th scope="col">pwd</th>
				<th scope="col">reg_at</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="bvo">
				<tr>
					<th scope="row"><a href="/board/detail?bno=${bvo.bno}">${bvo.bno}</a></th>
					<td>${bvo.title}</td>
					<td>${bvo.writer}</td>
					<td>${bvo.regAt}</td>
					<td>${bvo.modAt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>