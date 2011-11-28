package fashion.nugget.usage.display
{

	import fashion.nugget.i18n.Glossary;
	import fashion.nugget.text.BasicText;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.view.NuggetView;

	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta
	 */
	public class LanguageSelector extends NuggetView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function LanguageSelector()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			var i : int;
			var length : int = Glossary.instance.locales.length;
			var item : BasicText;
			var prev : BasicText;
			
			for(i = 0; i < length; i++)
			{
				item = new BasicText(Glossary.instance.locales[i].language, helveticaBold(14));
				item.x = prev ? prev.x + prev.width + 10 : 0;
				item.mouseChildren = false;
				item.buttonMode = true;
				item.addEventListener(MouseEvent.CLICK, onLanguageClick);
				addChild(item);
				prev = item;
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onLanguageClick(e : MouseEvent) : void
		{
			Glossary.instance.language = BasicText(e.target).text;
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function resize() : void
		{
			this.x = 50;
			this.y = stage.stageHeight - this.height - 50;
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
	}
}
