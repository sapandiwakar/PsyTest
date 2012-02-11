<%@page import="ch.epfl.psytest.domain.Response"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>

<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {
    var swipesArray = new Array();
    var storyTitles = new Array();
    var i = 0;
    /* <c:forEach items="${experiment.experimentSession.stories}" var="story">
    swipesArray[i] = Code.PhotoSwipe.attach(window.document
        .querySelectorAll('#story<c:out escapeXml='false' value="${story.id}"/> a'), {
      enableMouseWheel : false,
      enableKeyboard : true,
      allowUserZoom : false,
      loop : false,
      captionAndToolbarAutoHideDelay : 0
    });
    storyTitles[i] = '<c:out escapeXml='false' value="${story.title}"/>';
    ++i;
    $('#story<c:out escapeXml='false' value="${story.id}"/> li').hide().filter(':lt(1)').show();
    </c:forEach> */

    /* $('#storys').anythingSlider({
      resizeContents : false, // If true, solitary images/objects in the panel will expand to fit the viewport
      navigationSize : 3, // Set this to the maximum number of visible navigation tabs; false to disable
      navigationFormatter : function(index, panel) { // Format navigation labels with text
        return storyTitles[index - 1];
      },
      onSlideBegin : function(e, slider) {
        // keep the current navigation tab in view
        slider.navWindow(slider.targetPage);
      }
    }); */

    var storyDialog = $("#storys").dialog({
      height: $(document).height() - 20,
      width: $(document).width() - 20
    });
    
    $("#storys").awShowcase(
      	{
       		content_width:			$(document).width() - 20,
      		content_height:			$(document).height() - 20,
      		fit_to_parent:			true,
      		auto:					true,
      		interval:				3000,
      		continuous:				false,
      		loading:				true,      		
      		arrows:					true,
      		buttons:				true,
      		btn_numbers:			true,
      		keybord_keys:			true,
      		mousetrace:				false, /* Trace x and y coordinates for the mouse */
      		pauseonover:			true,
      		stoponclick:			true,
      		transition:				'hslide', /* hslide/vslide/fade */
      		transition_speed:		500,
      		transition_delay:		300,
      		show_caption:			'onhover', /* onload/onhover/show */
      		thumbnails:				false,
      		thumbnails_position:	'outside-last', /* outside-last/outside-first/inside-last/inside-first */
      		thumbnails_direction:	'horizontal', /* vertical/horizontal */
      		thumbnails_slidex:		0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
      		dynamic_height:			false, /* For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
      		speed_change:			false, /* Set to true to prevent users from swithing more then one slide at once. */
      		viewline:				false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
      	});
    
    
    
    $('#start-experiment').click(
        function() {
          $("#storys").dialog('open');  
    });
    
    $('#proceed').click(
        function() {
          <c:forEach items="${experiment.experimentSession.stories}" var="story">
          $.post('../responses', {
            question : <c:out escapeXml='false' value="${story.question.id}"/>,
            experiment : <c:out escapeXml='false' value="${experiment.id}"/>,
            answer : $(
                'input[name=choices-story-<c:out escapeXml='false' value="${story.id}"/>]:checked')
                .val(),
            choiceIndexOfAnswer : $(
                'input[name=choices-story-<c:out escapeXml='false' value="${story.id}"/>]:checked')
                .attr('index')
          }, function(data) {
            /* alert(data); */
          });
          </c:forEach>
          window.location.href = "../experiments";
        });
    /* $('#storys_div').dialog(); */

  }, false);
  
</script>
</head>
<body>

	<h1>
		<c:out escapeXml='false' value="${experiment.subjectName}" />
	</h1>

	<div id="storys_div">
		<div id="storys" class="showcase">
			<c:forEach items="${experiment.experimentSession.stories}"
				var="story">
				<%-- <li>
					<!-- Story begins here -->
					<h1>
						<c:out escapeXml='false' value="${story.title}" />
					</h1>
					<ul id="story<c:out escapeXml='false' value="${story.id}"/>"> --%>
				<!-- Slides in a story here-->
				<c:forEach items="${story.slides}" var="slide">
					<div class="showcase-slide">
						<div class="showcase-content">

							<a
								href="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>">
								<img
								src="../uploadedFiles/<c:out escapeXml='false' value="${slide.fileName}"/>"
								title="<c:out escapeXml='false' value="${slide.description}"/>">
								<!-- height="280px" width="420px" -->
							</a>
						</div>
					</div>
				</c:forEach>
				<!-- </ul> Question begins here -->
				<!-- <li> -->
				<div class="showcase-slide" id="question">
					<div class="showcase-content">

						<!-- Question -->
						<h1>
							<c:out escapeXml='false' value="${story.question.statement}" />
						</h1>

						<div id="question-choices">
							<c:forEach items="${story.question.choices}" var="choice"
								varStatus="status">
								<p class="question-choice">
									<input type="radio"
										name="choices-story-<c:out escapeXml='false' value="${story.id}"/>"
										value="<c:out escapeXml='false' value="${choice.id}"/>"
										id="radioStory<c:out escapeXml='false' value="${story.id}"/>Question<c:out escapeXml='false' value="${question.id}"/>Choice<c:out escapeXml='false' value="${choice.id}"/>"
										index="<c:out escapeXml='false' value="${status.count}"/>">
									<label
										for="radioStory<c:out escapeXml='false' value="${story.id}"/>Question<c:out escapeXml='false' value="${question.id}"/>Choice<c:out escapeXml='false' value="${choice.id}"/>">
										<c:out escapeXml='false' value="${choice.description}" />
									</label>
									<c:if test="${not empty choice.fileName}">
										<img class="float-right"
											src="../uploadedFiles/<c:out escapeXml='false' value="${choice.fileName}"/>"
											title="<c:out escapeXml='false' value="${choice.description}"/>"
											style="vertical-align: middle" height="140px" width="210px">
									</c:if>
									<br /> <br />
								</p>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Question Ends -->
				<!-- </li> -->
				<!-- </li> -->
				<!-- Story Ends -->
			</c:forEach>


		</div>
	</div>

	<div id="fc_ch_epfl_psytest_domain_Response_submit" class="submit">
		<!-- <script type="text/javascript">
			Spring.addDecoration(new Spring.ValidateAllDecoration({
				elementId : 'proceed',
				event : 'onclick'
			}));
		</script> -->
		<input value="Start Experiment" type="submit" id="start-experiment">
		<input value="Save" type="submit" id="proceed">
	</div>
</body>
</html>