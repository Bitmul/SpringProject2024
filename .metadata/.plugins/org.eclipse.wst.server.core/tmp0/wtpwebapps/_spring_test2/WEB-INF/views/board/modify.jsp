<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<div class="container-md">
	<h1>즐거운 이야기 게시판</h1>
	<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<form action="/board/modify" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label for="bno" class="form-label">bno</label> <input
				class="form-control" name="bno" id="bno" value="${bvo.bno}"
				readonly="readonly"></input>
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">title</label> <input
				class="form-control" name="title" id="title" value="${bvo.title}"></input>
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">writer</label> <input
				class="form-control" name="writer" id="writer" value="${bvo.writer}"
				readonly="readonly"></input>
		</div>
		<div class="mb-3">
			<label for="reg_date" class="form-label">reg_date</label> <input
				class="form-control" name="regAt" id="regAt" value="${bvo.regAt}"
				readonly="readonly"></input>
		</div>
		<div class="mb-3">
			<label for="read_count" class="form-label">mod_date</label> <input
				class="form-control" name="modAt" id="modAt" value="${bvo.modAt}"
				readonly="readonly"></input>
		</div>
		<div class="mb-3">
			<label for="read_count" class="form-label">readCount</label> <input
				class="form-control" name="readCount" id="readCount"
				value="${bvo.readCount}" readonly="readonly"></input>
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">content</label>
			<textarea class="form-control" name="content" id="content">${bvo.content}</textarea>
		</div>

		<c:set value="${bdto.flist}" var="flist"></c:set>

		<div class="col-12">
			<label for="f" class="form-label">File</label>
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist}" var="fvo">
					<li class="list-group-item"><c:choose>
							<c:when test="${fvo.filetype == 1}">
								<div>
									<img alt=""
										src="/upload/${fvo.savedir}/${fvo.uuid}_th_${fvo.filename}">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-card-image"
										viewBox="0 0 16 16">
  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
  <path
											d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z" />
</svg>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.filename }</div>
							<span class="badge rounded-pill text-bg-secondary">${fvo.filesize}</span>
							<button type="button" data-uuid="${fvo.uuid }"
								class="btn btn-outline-danger file-x">X</button>
						</div></li>
				</c:forEach>
			</ul>
			<div class="mb-3">
				<input type="file" class="form-control" name="files" id="files"
					multiple="multiple" style="display: none">
				<button type="button" id="trigger" class="btn btn-outline-primary">FileUpload</button>
			</div>
			<div class="mb-3" id="fileZone"></div>
		</div>

		<a href="/board/list?rc=1"><button type="button"
				class="btn btn-success">리스트로</button></a>
		<button type="submit" class="btn btn-warning" id="regBtn">수정하기</button>
	</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<script src="/resources/js/boardModify.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>