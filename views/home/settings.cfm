<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">

	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/info.png" alt="info" width="24" height="24" />Need Help?
		</div>
		<div class="body">
			<a href="http://www.ortussolutions.com" target="_blank" title="The Gurus behind ColdBox and ContentBox">
			<div class="center"><img src="#prc.cbroot#/includes/images/ortus-top-logo.png" alt="Ortus Solutions" border="0" /></a><br/></div>

			<p><strong>Ortus Solutions</strong> is the company behind anything ColdBox and ContentBox. Need professional support, architecture analysis,
			code reviews, custom development or anything ColdFusion, ColdBox, ContentBox related?
			<a href="mailto:help@ortussolutions.com">Contact us</a>, we are here
			to help!</p>

			<p>
				<h2>Resource Links</h2>
				<ul>
					<li>
						<a href="http://code.google.com/p/htmlcompressor/" target="_blank">HTML Compressor Google Code</a>
					</li>
					<li>
						<a href="http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html" target="_blank">HTML Compressor Java Docs</a>
					</li>
				</ul>
			</p>
		</div>
	</div>

</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			PasteBin Settings
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#

			<p>
				Below you can modify the settings used by the PasteBin module. If you do not have an API key
				then you can get one at
				<a href="http://pastebin.com/api" target="_blank"><button class="button2">http://pastebin.com/api</button></a>
			</p>
			<p>
				In your editors you will get a new icon for pasting cool PasteBin content (<img src="#event.getModuleRoot('PasteBin')#/includes/cbPasteBin/source.png" alt="icon" />).
				Please note that you need internet connectivity in order to use this module as we make API calls to <em>pastebin.com</em>.
			</p>

			#html.startForm(action="cbadmin.module.pasteBin.home.saveSettings",name="settingsForm")#

				<fieldset>
				<legend><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> <strong>Options</strong></legend>
					#html.textField(name="pastebin_api_key", label="Developer API Key:", value="#prc.settings.pastebin_api_key#", class="textfield width98", required="required")#
				</fieldset>

				<!--- Submit --->
				<div class="actionBar center">
					#html.submitButton(value="Save Settings",class="buttonred",title="Save the HTML Compressor settings")#
				</div>

			#html.endForm()#

		</div>
	</div>
</div>
</cfoutput>