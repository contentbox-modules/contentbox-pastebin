<cfoutput>
<!--- Custom Javascript --->
<script type="text/javascript">
function embedPasteBin(){
	var embedCode = "";
	$.ajax({
		type : "post",
		url : '#prc.xehEmbedCode#',
		data : $("##pasteBinForm").serialize(),
		async : false,
		success : function(data){
			embedCode = data;
		}
	});
	sendEditorText( embedCode );
}
function sendEditorText(text){
	$("###rc.editorName#").ckeditorGet().insertHtml( text );
	closeRemoteModal();
}
</script>
</cfoutput>