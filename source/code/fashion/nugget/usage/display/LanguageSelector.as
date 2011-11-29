package fashion.nugget.usage.display
{

	import fashion.nugget.events.GlossaryEvent;
	import fashion.nugget.i18n.Glossary;
	import fashion.nugget.text.BasicText;
	import fashion.nugget.text.GlossaryText;
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
		protected var _label : GlossaryText;
		
		protected var _items : Vector.<BasicText>;
		
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
			
			_items = new Vector.<BasicText>();
			_label = new GlossaryText("glossary.select-language", helveticaBold(14, 0x999999));
			addChild(_label);
			
			for(i = 0; i < length; i++)
			{
				item = new BasicText(Glossary.instance.locales[i].language, helveticaBold(14));
				item.x = prev ? prev.x + prev.width + 10 : _label.x + _label.width + 10;
				item.mouseChildren = false;
				item.buttonMode = true;
				item.addEventListener(MouseEvent.CLICK, onLanguageClick);
				addChild(item);
				_items.push(item);
				prev = item;
			}
			
			Glossary.instance.addEventListener(GlossaryEvent.TRANSLATE_COMPLETED, onLanguageChange);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onLanguageClick(e : MouseEvent) : void
		{
			Glossary.instance.language = BasicText(e.target).text;
		}
		
		protected function onLanguageChange(e : GlossaryEvent) : void
		{
			var i : int;
			var length : int = _items.length;
			for(i = 0; i < length; i++)
			{
				_items[i].x = i != 0 ? _items[i - 1].x + _items[i - 1].width + 10 : _label.x + _label.width + 10;
			}
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
