<cfoutput>
<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-code fa-lg"></i> PasteBin Settings</h1>
    </div>
</div>

<div class="row">
	<div class="col-md-9">

		<div class="panel panel-default">
		    <div class="panel-body">
				#getInstance("MessageBox@cbMessageBox").renderit()#

				<p>
					Below you can modify the settings used by the PasteBin module. If you do not have an API key
					then you can get one at
					<a href="http://pastebin.com/api" target="_blank"><button class="btn btn-default btn-sm">http://pastebin.com/api</button></a>
				</p>
				<p>
					In your editors you will get a new icon for pasting cool PasteBin content (<img src="#event.getModuleRoot('contentbox-pastebin')#/includes/cbPasteBin/source.png" alt="icon" />).
					Please note that you need internet connectivity in order to use this module as we make API calls to <em>pastebin.com</em>.
				</p>

				#html.startForm(action="cbadmin.module.contentbox-pastebin.home.saveSettings",name="settingsForm")#

					<fieldset>
					<legend><strong>Options</strong></legend>
						<div class="form-group">
							#html.textField(
								name="pastebin_api_key", 
								label="Developer API Key:", 
								value="#prc.settings.pastebin_api_key#", 
								class="form-control", 
								required="required"
							)#
						</div>
					</fieldset>

					<!--- Submit --->
					<div class="form-group text-center">
						#html.submitButton(value="Save Settings",class="btn btn-danger",title="Save the HTML Compressor settings")#
					</div>

				#html.endForm()#
		    </div>
		</div>

	</div>

	<div class="col-md-3">
		<!--- Info Box --->
		<div class="panel panel-primary">
		    <div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-medkit"></i> Need Help?</h3>
		    </div>
		    <div class="panel-body">
		    	#renderview(view="_tags/needhelp", module="contentbox-admin" )#
		    </div>
		</div>
	</div>
</div>
</cfoutput>