package fashion.nugget.usage
{

	import fashion.nugget.abstract.AbstractAppLoader;
	import fashion.nugget.display.Box;
	import fashion.nugget.util.display.safeRemoveChild;

	import com.greensock.events.LoaderEvent;
	
	
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="1000", height="700")]
	public class Preloader extends AbstractAppLoader
	{
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _bar : Box;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Preloader()
		{
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		override protected function onLoadStarted(e : LoaderEvent) : void
		{
			_bar = new Box(0, 500, 3);
			_bar.x = int(1000 * .5 - _bar.width * .5);
			_bar.y = int(700 * .5 - _bar.height * .5);
			_bar.scaleX = 0;
			addChild(_bar);
		}
		
		override protected function onLoadProgress(e : LoaderEvent) : void
		{
			_bar.scaleX = _loader.progress;
		}
		
		override protected function onLoadCompleted(e : LoaderEvent) : void
		{
			safeRemoveChild(_bar);
			
			super.onLoadCompleted(e);
		}
	}
}
