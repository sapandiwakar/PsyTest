<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>


<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {

    var myPhotoSwipe = Code.PhotoSwipe.attach(window.document.querySelectorAll('#slides a'), {
      enableMouseWheel : false,
      enableKeyboard : true,
      allowUserZoom : false,
      loop : false,
      captionAndToolbarAutoHideDelay : 0
    });

    $("#sortable").sortable();
    $("#sortable").disableSelection();

    $('#proceed').click(function() {
      var result = $('#sortable').sortable('toArray');

      var version = <c:out escapeXml='false' value="${story.version}"/> + 1;
      var queryString = "_method=PUT";
      for (var i = 0; i < result.length; ++i) {
        queryString += "&slides="+result[i];
      }
      queryString += "&_slides=1&question=<c:out escapeXml='false' value="${story.question.id}"/>&title=<c:out escapeXml='false' value="${story.title}"/>&id=<c:out escapeXml='false' value="${story.id}"/>&version="+version;
      $.ajax({
        url : '../storys',
        type : 'POST',
        data : queryString,
        success : function(response) {
        }
      });

      /* $.post('../storys', {
        _method : "PUT",
        slides : result,
        _slides : 1,
        question : "<c:out escapeXml='false' value="${story.question.id}"/>",
        title : "<c:out escapeXml='false' value="${story.title}"/>",
        id : "<c:out escapeXml='false' value="${story.id}"/>",
        Version : <c:out escapeXml='false' value="${story.version}"/>+1
      }); */

    });

  }, false);
</script>
</head>
<body>

	<h1>
		<c:out escapeXml='false' value="${story.title}" />
	</h1>

	<%-- <div id="slides" style="padding: 5px; height: 280px; width: 420px; background-color: #E6E6E0">
	<c:forEach items="${story.slides}" var="slide">
		<img src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>" title="<c:out escapeXml='false' value="${slide.description}"/>" height="280px" width="420px"> 
	</c:forEach>
</div> --%>

	<div id="slides" class="gallery">
		<ul id="sortable">
			<c:forEach items="${story.slides}" var="slide">
				<li id="<c:out escapeXml='false' value="${slide.id}"/>"><a
					href="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"><img
						src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"
						alt="<c:out escapeXml='false' value="${slide.description}"/>"
						height="280px" width="420px"> <span
						class="flc-reorderer-imageTitle  fl-imageReorderer-caption"><c:out
								escapeXml='false' value="${slide.description}" /> </span> </a></li>
			</c:forEach>
		</ul>
	</div>

	<input value="Save" type="submit" id="proceed">
</body>
</html>