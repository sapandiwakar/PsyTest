<?xml version="1.0" encoding="UTF-8" standalone="no"?>


<html xmlns:field="urn:jsptagdir:/WEB-INF/tags/form/fields"
	xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:page="urn:jsptagdir:/WEB-INF/tags/form" version="2.0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<%@ include file="../../../html/libraries.html"%>
<script type="text/javascript">
	Ext.onReady(function() {
		Ext.QuickTips.init();

		new Ext.ux.Carousel('storys', {

            itemSelector: 'div.item',

            interval: 5,

            autoPlay: true,

            //transitionEasing: 'easeIn'                 

        });
	});
</script>
</head>
<body>

	<h1>
		<c:out escapeXml='false' value="${experiment.subjectName}" />
	</h1>

	<div id= "storys"
		style="padding: 5px; height: 280px; width: 420px; background-color: #E6E6E0">
		<c:forEach items="${experiment.stories}" var="story">
			<div class="item"
				title="hkjh">
				<page:show
					id="ch.ephl.story.<c:out escapeXml='false' value="${story.title}"/>"					
					object="${story}" path="/storys">
				</page:show>
			</div>
		</c:forEach>
	</div>

</body>
</html>