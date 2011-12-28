<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../../../html/libraries.html"%>


<script type="text/javascript">
	Ext.onReady(function() {
		Ext.QuickTips.init();
		
		new Ext.ux.Carousel('slides');		
	});
</script>
</head>
<body>

<div id="slides" style="padding: 5px; height: 280px; width: 420px; background-color: #E6E6E0">


    		<img src="../images/2.jpg" title="Masterpiece">
            <img src="../images/3.jpg" title="Teeth">
            <img src="../images/4.jpg" title="Roar">            
        </div>
</body>

</html>