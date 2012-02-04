<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>


<script type="text/javascript">
	/* Ext.onReady(function() {
		Ext.QuickTips.init();
		
		new Ext.ux.Carousel('slides');		
	}); */
	document.addEventListener('DOMContentLoaded', function(){

		var myPhotoSwipe = Code.PhotoSwipe.attach( window.document.querySelectorAll('#slides a'), { enableMouseWheel: false , enableKeyboard: true, allowUserZoom: false, loop: false, captionAndToolbarAutoHideDelay: 0 } );

	}, false);
</script>
</head>
<body>

<h1><c:out escapeXml='false' value="${story.title}"/></h1>

<%-- <div id="slides" style="padding: 5px; height: 280px; width: 420px; background-color: #E6E6E0">
	<c:forEach items="${story.slides}" var="slide">
		<img src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>" title="<c:out escapeXml='false' value="${slide.description}"/>" height="280px" width="420px"> 
	</c:forEach>
</div> --%>

<ul id="slides" class="gallery">
	<c:forEach items="${story.slides}" var="slide">
		<li><a href="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"><img src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>" alt="<c:out escapeXml='false' value="${slide.description}"/>" height="280px" width="420px"></a></li> 
	</c:forEach>
</ul>
</body>
</html>