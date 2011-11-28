package fashion.nugget.usage
{

	import fashion.nugget.abstract.AbstractApp;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.usage.display.LanguageSelector;
	import fashion.nugget.usage.display.Menu;
	import fashion.nugget.usage.section.Home;
	import fashion.nugget.usage.section.Products;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="1000", height="700")]
	public class Main extends AbstractApp
	{
		
		public function Main()
		{
		}
		
		override protected function onAppReady(e : NuggetEvent) : void
		{
			// Add the LanguageSelector view
			_app.views.add("language_selector", new LanguageSelector());
			// Add the Menu to the view
			_app.views.add("menu", new Menu());
			// Register the views of your application
			_app.registerSections(Home, Products);
			// Navigate to the default section
			_app.navigation.toDefault();
		}
		
	}
}
