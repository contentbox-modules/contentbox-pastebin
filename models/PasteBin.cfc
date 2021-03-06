/**
* Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.ortussolutions.com
* @author Luis Majano
* 
* PasteBin Interface
**/
component accessors="true"{

	// Compressor Settings
	property name="settings" inject="coldbox:moduleSettings:contentbox-pastebin";

	// Constructor
	function init(){
		return this;
	}

	/**
	* Sends a pastebin request
	*/
	function send(required string code, string format="", string title=""){
		var pastebinURL = "https://pastebin.com/api/api_post.php";

		var pastebinService = new HTTP(url=pastebinURL, method="post", resolveURL=true, timeout="10");
		pastebinService.addParam(type="formfield", name="api_dev_key", value=settings.pastebin_api_key);
		pastebinService.addParam(type="formfield", name="api_user_key", value="");
		pastebinService.addParam(type="formfield", name="api_paste_code", value=arguments.code);
		pastebinService.addParam(type="formfield", name="api_option", value="paste");
		if( len( arguments.title ) ){
			pastebinService.addParam(type="formfield", name="api_paste_name", value=urlEncodedFormat( arguments.title ));
		}
		if( len( arguments.format ) ){
			pastebinService.addParam(type="formfield", name="api_paste_format", value=arguments.format);
		}

		var results = pastebinService.send().getPrefix();
		var embedCode = replacenocase( results.filecontent, "https://pastebin.com/", "");
		return '<iframe src="https://pastebin.com/embed_iframe.php?i=#embedCode#" style="border:none;width:100%;"></iframe>';
	}

}
