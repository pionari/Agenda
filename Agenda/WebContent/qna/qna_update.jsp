<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/qna/qna_update.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
  	<c:choose>
    	<c:when test="${empty logindto }">
    		<jsp:include page="../header/header.jsp" />
    	</c:when>
    	<c:otherwise>
    		<jsp:include page="../header/loginMain.jsp" />
    	</c:otherwise>
	</c:choose>
    
    <!-- 섹션 -->
	<section>
		<h1>Q&A 글수정</h1>
		<hr>
		<form action="${pageContext.request.contextPath}/qnaController.do" method="post">
			<input type="hidden" name="qna_no" value="${update.qna_no }">
			<input type="hidden" name="command" value="updateres">
			<table border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="member_id" value="${update.member_id }" disabled="disabled"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_title" value="${update.qna_title }"></td>
				</tr>
				<tr>
					<td colspan="2"><div id="editor" name="qna_content"></div></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정" onclick="formSubmit()"> 
					<input type="button" value="취소"
						onclick="location.href='${pageContext.request.contextPath}/qna/index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	
	<!-- 풋터 -->
    <jsp:include page="../footer/mainFooter.jsp" />
    
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'tab',
			height : '300px',
			initialValue : `${update.qna_content }`,
			initialEditType : 'wysiwyg'
		});

		editor.getHtml();

		function formSubmit() {
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "qna_content")
			input.setAttribute("value", editor.getHtml());
			document.querySelector("#editor").append(input);
		}
	</script>
</body>

</html>