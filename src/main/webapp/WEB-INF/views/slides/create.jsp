<form id="slide" action="/PsyTest/slides" method="POST"
	enctype="multipart/form-data" onsubmit="encodePk()">
	
	File:  <input type="file" name="file" />  
	
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