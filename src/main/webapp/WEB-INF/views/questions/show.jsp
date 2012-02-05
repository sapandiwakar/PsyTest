<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>
</head>

<body>

	<h1>
		<c:out escapeXml='false' value="${question.statement}" />
	</h1>

	<div id="question_choices">
		<c:forEach items="${question.choices}" var="choice">
			<input type="radio" name="choices"
				value="<c:out escapeXml='false' value="${choice.description}"/>">
			<c:out escapeXml='false' value="${choice.description}" />
			<br />
			<c:if test="${not empty choice.fileName}">
				<img
					src="../uploadedFiles/<c:out escapeXml='false' value="${choice.fileName}"/>"
					title="<c:out escapeXml='false' value="${choice.description}"/>"
					style="vertical-align: middle" height="140px" width="210px">
			</c:if>
			<br />
			<br />
		</c:forEach>
	</div>

</body>
</html>