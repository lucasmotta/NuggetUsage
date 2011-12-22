package fashion.nugget.usage
{

	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.LoaderMax;
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
			LoaderMax.activate([VideoLoader, ImageLoader]);
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
		
		override public function set navigationXML(value : XML) : void
		{
			//active SWFAddress
			_navigation = new SWFAddressNavigation( value );
		}
	}
}
