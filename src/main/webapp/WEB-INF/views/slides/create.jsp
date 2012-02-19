<form id="slide" action="/PsyTest/slides" method="POST"
	enctype="multipart/form-data" onsubmit="encodePk()">

	<label for="_file_id">File : </label><input id="_file_id" type="file"
		name="file" /> <br />
	<br />
	<div id="_c_ch_epfl_psytest_domain_Slide_description_id">
		<label for="_description_id">Description : </label><input
			id="_description_id" name="description" type="text" value="" /><br />
		<script type="text/javascript">
      Spring.addDecoration(new Spring.ElementDecoration({
        elementId : '_description_id',
        widgetType : 'dijit.form.ValidationTextBox',
        widgetAttrs : {
          promptMessage : 'Enter Description',
          invalidMessage : 'Please enter valid Description',
          required : false,
          missingMessage : ''
        }
      }));
    </script>
	</div>
	<br />
	
	<script type="text/javascript">
    dojo.require("dijit.form.CheckBox");
  </script>
	<div id="__id">
		<label for="_isControlSlide_id">Is Control Slide: </label><input
			id="_isControlSlide_id" name="isControlSlide" type="checkbox"
			value="true" /><input type="hidden" name="_isControlSlide" value="on" />
		<script type="text/javascript">
      Spring.addDecoration(new Spring.ElementDecoration({
        elementId : '_isControlSlide_id',
        widgetType : 'dijit.form.CheckBox',
        widgetAttrs : {}
      }));
    </script>
	</div>
	<br />
	<!-- <div id="_c_ch_epfl_psytest_domain_Slide_iscontrolslide_id">
		<label for="_iscontrolslide_id">Control Slide: </label><input
			id="_iscontrolslide_id" name="iscontrolslide" type="checkbox" value="" /><br />
		<script type="text/javascript">
			Spring.addDecoration(new Spring.ElementDecoration({
				elementId : '_iscontrolslide_id',
				widgetType : 'dijit.form.CheckBox',
				widgetAttrs : {
					required : false,
					missingMessage : ''
				}
			}));

		</script>
	</div> -->
	<br />
	<div id="fu_ch_epfl_psytest_domain_Slide_submit" class="submit">
		<script type="text/javascript">
      Spring.addDecoration(new Spring.ValidateAllDecoration({
        elementId : 'proceed',
        event : 'onclick'
      }));
    </script>
		<input value="Save" type="submit" id="proceed" />
	</div>
</form>