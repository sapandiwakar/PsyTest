<%@page import="ch.epfl.psytest.domain.Response"%>
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
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var swipesArray = new Array();
						var storyTitles = new Array();
						var i = 0;
						<c:forEach items="${experiment.experimentSession.stories}" var="story">
						swipesArray[i] = Code.PhotoSwipe
								.attach(
										window.document
												.querySelectorAll('#story<c:out escapeXml='false' value="${story.id}"/> a'),
										{
											enableMouseWheel : false,
											enableKeyboard : true,
											allowUserZoom : false,
											loop : false,
											captionAndToolbarAutoHideDelay : 0
										});
						storyTitles[i] = '<c:out escapeXml='false' value="${story.title}"/>';
						++i;
						$(
								'#story<c:out escapeXml='false' value="${story.id}"/> li')
								.hide().filter(':lt(1)').show();
						</c:forEach>

						$('#storys').anythingSlider({
							resizeContents : false, // If true, solitary images/objects in the panel will expand to fit the viewport
							navigationSize : 3, // Set this to the maximum number of visible navigation tabs; false to disable
							navigationFormatter : function(index, panel) { // Format navigation labels with text
								return storyTitles[index - 1];
							},
							onSlideBegin : function(e, slider) {
								// keep the current navigation tab in view
								slider.navWindow(slider.targetPage);
							}
						});

						
						$('#proceed').click(function() {
							<c:forEach items="${experiment.experimentSession.stories}" var="story">
							var val_a = $('input[name=choices-story-<c:out escapeXml='false' value="${story.id}"/>]:checked').val();
							var val_q = <c:out escapeXml='false' value="${story.question.id}"/>;
							var val_e = <c:out escapeXml='false' value="${experiment.id}"/>;
							
							$.post('../responses', {
								question: <c:out escapeXml='false' value="${story.question.id}"/>,
								experiment: <c:out escapeXml='false' value="${experiment.id}"/>,
								answer: $('input[name=choices-story-<c:out escapeXml='false' value="${story.id}"/>]:checked').val() 
							}, function (data) {
								/* alert(data); */
							}
							);
							</c:forEach>
							window.location.href = "../experiments";
						});
						

					}, false);
</script>
</head>
<body>

	<h1>
		<c:out escapeXml='false' value="${experiment.subjectName}" />
	</h1>

	<div id="storys_div">
		<ul id="storys">
			<c:forEach items="${experiment.experimentSession.stories}"
				var="story">
				<li>
					<!-- Story begins here -->
					<h1>
						<c:out escapeXml='false' value="${story.title}" />
					</h1>
					<ul id="story<c:out escapeXml='false' value="${story.id}"/>">
						<!-- Slides in a story here-->
						<c:forEach items="${story.slides}" var="slide">
							<li><a
								href="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>">
									<img
									src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"
									title="<c:out escapeXml='false' value="${slide.description}"/>"
									height="280px" width="420px">
							</a></li>
						</c:forEach>
					</ul> <!-- Question begins here -->
					<div id="question">
						<!-- Question -->
						<h1>
							<c:out escapeXml='false' value="${story.question.statement}" />
						</h1>

						<div id="question-choices">
							<c:forEach items="${story.question.choices}" var="choice">
								<p class="question-choice">
									<input type="radio" name="choices-story-<c:out escapeXml='false' value="${story.id}"/>"
										value="<c:out escapeXml='false' value="${choice.id}"/>"
										id="radioStory<c:out escapeXml='false' value="${story.id}"/>Question<c:out escapeXml='false' value="${question.id}"/>Choice<c:out escapeXml='false' value="${choice.id}"/>">
									<label
										for="radioStory<c:out escapeXml='false' value="${story.id}"/>Question<c:out escapeXml='false' value="${question.id}"/>Choice<c:out escapeXml='false' value="${choice.id}"/>">
										<c:out escapeXml='false' value="${choice.description}" />
									</label> <img class="float-right"
										src="../uploadedFiles/<c:out escapeXml='false' value="${choice.fileName}"/>"
										title="<c:out escapeXml='false' value="${choice.description}"/>"
										style="vertical-align: middle" height="140px" width="210px">
									<br /> <br />
								</p>
							</c:forEach>
						</div>
					</div> <!-- Question Ends -->
				</li>
				<!-- Story Ends -->
			</c:forEach>


		</ul>
	</div>

	<div id="fc_ch_epfl_psytest_domain_Response_submit" class="submit">
		<!-- <script type="text/javascript">
			Spring.addDecoration(new Spring.ValidateAllDecoration({
				elementId : 'proceed',
				event : 'onclick'
			}));
		</script> -->
		<input value="Save" type="submit" id="proceed">
	</div>
</body>
</html>