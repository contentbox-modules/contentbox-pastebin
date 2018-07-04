component {

	// Module Properties
	this.title 				= "PasteBin";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "Helps you embedd code into your pages via PateBin";
	this.version			= "2.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "contentbox-pastebin";

	function configure(){

		// Compressor Settings
		settings = {
			// Developer Key
			pastebin_api_key = ""
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// objects
		binder.map("PasteBin@PasteBin").to("#moduleMapping#.models.PasteBin");
	}

	/**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorExtraPlugins(event, interceptData){
		arrayAppend( arguments.interceptData.extraPlugins, "cbPasteBin" );
	}

	/**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorToolbar(event, interceptData){
		var itemLen = arrayLen( arguments.interceptData.toolbar );
		for( var x =1; x lte itemLen; x++ ){
			if( isStruct(arguments.interceptData.toolbar[x])
			    AND arguments.interceptData.toolbar[x].name eq "contentbox" ){
				arrayAppend( arguments.interceptData.toolbar[x].items, "cbPasteBin");
				break;
			}
		}
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Add Menu Contribution
		menuService.addSubMenu(topMenu=menuService.MODULES,name="PasteBin",label="PasteBin",href="#menuService.buildModuleLink('contentbox-pastebin','home.settings')#");
		// Override settings?
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="cbox-pastebin"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			// override settings from contentbox custom setting
			controller.getSetting("modules")[ "contentbox-pastebin" ].settings = deserializeJSON( setting.getvalue() );
		}
	}

	/**
	* Fired when the module is activated
	*/
	function onActivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// store default settings
		var findArgs = {name="cbox-pastebin"};
		var setting = settingService.findWhere(criteria=findArgs);
		if( isNull(setting) ){
			var args = {name="cbox-pastebin", value=serializeJSON( settings )};
			var pasteBinSettings = settingService.new(properties=args);
			settingService.save( pasteBinSettings );
		}

		// Install the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting( "modules" )[ "contentbox-admin" ].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/cbPasteBin";
		var pluginPath = moduleMapping & "/includes/cbPasteBin";
		directoryCopy(source=pluginPath, destination=ckeditorPluginsPath);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Remove Menu Contribution
		menuService.removeSubMenu(topMenu=menuService.MODULES,name="PasteBin");
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="cbox-pastebin"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			settingService.delete( setting );
		}
		// Uninstall the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting( "modules" )[ "contentbox-admin" ].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/cbPasteBin";
		var pluginPath = moduleMapping & "/includes/cbPasteBin";
		directoryDelete(path=ckeditorPluginsPath, recurse=true);
	}
}
