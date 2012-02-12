
<html>
<head>
<script type="text/javascript">
  
<%@ include file="../../../js/jquery-1.7.1.min.js"%>
jQuery.download = function(url, data, method){
	//url and data options required
	if( url && data ){ 
		//data can be string of parameters or array/object
		data = typeof data == 'string' ? data : jQuery.param(data);
		//split params into form inputs
		var inputs = '';
		jQuery.each(data.split('&'), function(){ 
			var pair = this.split('=');
			inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />'; 
		});
		//send request
		jQuery('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>')
		.appendTo('body').submit().remove();
	};
};

  document.addEventListener('DOMContentLoaded', function() {
    $.download('get', 'file=file', 'get');
  }, false);
</script>
</head>
<body>

	<div id="main">
		<div>
			<script type="text/javascript">
        dojo.require('dijit.TitlePane');
      </script>
			<div id="_title_title_id">
				<script type="text/javascript">
          Spring.addDecoration(new Spring.ElementDecoration({
            elementId : '_title_title_id',
            widgetType : 'dijit.TitlePane',
            widgetAttrs : {
              title : 'Data Exported',
              open : true
            }
          }));
        </script>
				<h3>Your download is in progress...</h3>
				<a href="/exporteddata.csv">download</a>
			</div>
		</div>
	</div>
</body>
</html>