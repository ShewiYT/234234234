<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
	$(document).ready(function(){
		$( document ).tooltip({
			items: "[data-tooltip]",
			content: function() {
				return $(this).attr('data-tooltip');
			},
			tooltipClass: "deertip",
			track: true
		});
	});
</script>

<?=$this->controller?>