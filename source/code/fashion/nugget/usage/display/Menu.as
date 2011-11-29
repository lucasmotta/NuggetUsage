package fashion.nugget.usage.display
{

	import fashion.nugget.i18n.Glossary;
	import fashion.nugget.events.GlossaryEvent;
	import fashion.nugget.i18n.spell;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.util.string.printf;
	import fashion.nugget.view.NuggetView;

	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta
	 */
	public class Menu extends NuggetView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _label : GlossaryText;
		
		protected var _items : Vector.<Item>;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Menu()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			var i : int;
			var list : XMLList = spell("menu.item");
			var length : int = list.length();
			var item : Item;
			var prev : Item;
			
			_items = new Vector.<Item>();
			
			_label = new GlossaryText("menu.label", helveticaBold(14, 0x999999));
			addChild(_label);
			
			for(i = 0; i < length; i++)
			{
				item = new Item(printf("menu.item#%f", i), spell(printf("menu.item#%f@id", i)));
				item.x = prev ? prev.x + prev.width + 10 : _label.x + _label.width + 10;
				item.addEventListener(MouseEvent.CLICK, onMenuClick);
				addChild(item);
				_items.push(item);
				prev = item;
			}
			
			Glossary.instance.addEventListener(GlossaryEvent.TRANSLATE_COMPLETED, onLanguageChange);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onMenuClick(e : MouseEvent) : void
		{
			this.nugget.navigation.to(Item(e.target).value);
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
			this.y = stage.stageHeight - this.height - 80;
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
	}
}
