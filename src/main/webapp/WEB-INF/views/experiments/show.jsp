<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>

<script type="text/javascript">
/* 	Ext.onReady(function() {
		Ext.QuickTips.init();

		new Ext.ux.Carousel('slides', {

			transitionEasing : 'easeIn'
		});
	}); */
	document.addEventListener('DOMContentLoaded', function(){
		var swipesArray = new Array();
		var i = 0;
		<c:forEach items="${experiment.experimentSession.stories}" var="story">
			swipesArray[i] = Code.PhotoSwipe.attach( window.document.querySelectorAll('#story<c:out escapeXml='false' value="${story.id}"/> a'), { enableMouseWheel: false , enableKeyboard: true, allowUserZoom: false, loop: false, captionAndToolbarAutoHideDelay: 0 } );
			++i;
		</c:forEach>
	}, false);
	
</script>
</head>
<body>

	<h1>
		<c:out escapeXml='false' value="${experiment.subjectName}" />
	</h1>

	<div id="storys">
		<c:forEach items="${experiment.experimentSession.stories}" var="story">

			<h1><c:out escapeXml='false' value="${story.title}"/></h1>
			<ul id="story<c:out escapeXml='false' value="${story.id}"/>">
			<!-- Slides -->
			<c:forEach items="${story.slides}" var="slide">
					<li><a href="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>">
						<img src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"
						title="<c:out escapeXml='false' value="${slide.description}"/>"
						height="280px" width="420px">
					</a></li>
				
			</c:forEach>
			</ul>
			
			<div id="question">
				<!-- Question -->
				<h1>
					<c:out escapeXml='false' value="${story.question.statement}" />
				</h1>

				<div id="question_choices">
					<c:forEach items="${story.question.choices}" var="choice">
						<input type="radio" name="choices"
							value="<c:out escapeXml='false' value="${choice.description}"/>">
						<c:out escapeXml='false' value="${choice.description}" />
						<br />
						<img
							src="../uploadedFiles/<c:out escapeXml='false' value="${choice.fileName}"/>"
							title="<c:out escapeXml='false' value="${choice.description}"/>"
							style="vertical-align: middle" height="140px" width="210px">
						<br />
						<br />
					</c:forEach>
				</div>
			</div>
		</c:forEach>


	</div>

</body>
</html>