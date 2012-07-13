component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";
	property name="pasteBin" 		inject="pasteBin@pasteBin";

	function settings(event,rc,prc){
		// Exit handler
		prc.xehSave = cb.buildModuleLink("PasteBin","home.saveSettings");
		prc.tabModules_PasteBin = true;
		// settings
		prc.settings = getModuleSettings("PasteBin").settings;
		// view
		event.setView("home/settings");
	}

	function saveSettings(event,rc,prc){
		// Get compressor settings
		prc.settings = getModuleSettings("PasteBin").settings;

		// iterate over settings
		for(var key in prc.settings){
			// save only sent in setting keys
			if( structKeyExists(rc, key) ){
				prc.settings[ key ] = rc[ key ];
			}
		}

		// Save settings
		var args = {name="cbox-pastebin"};
		var setting = settingService.findWhere(criteria=args);
		setting.setValue( serializeJSON( prc.settings ) );
		settingService.save( setting );

		// Messagebox
		getPlugin("MessageBox").info("Settings Saved & Updated!");
		// Relocate via CB Helper
		cb.setNextModuleEvent("PasteBin","home.settings");
	}

	function embedCode(event,rc,prc){
		event.paramValue("code","").paramValue("code_format","cfm").paramValue("code_title","");
		return pasteBin.send(code=rc.code, format=rc.code_format, title=rc.code_title);
	}

	function entry(event,rc,prc){
		// settings
		prc.settings = getModuleSettings("PasteBin").settings;
		prc.xehEmbedCode = cb.buildModuleLink("PasteBin","home.embedCode");

		// view
		event.setView(view="home/entry")
			.setLayout(name="ajax", module="contentbox-admin");
	}

}