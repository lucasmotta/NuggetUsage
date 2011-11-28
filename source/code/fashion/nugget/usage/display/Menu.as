package fashion.nugget.usage.display
{

	import fashion.nugget.text.BasicText;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.text.helveticaBold;
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
			var list : XMLList = this.nugget.navigation.xml.child("section");
			var length : int = list.length();
			var item : BasicText;
			var prev : BasicText;
			
			_label = new GlossaryText("menu.label");
			
			for(i = 0; i < length; i++)
			{
				item = new BasicText(list[i].@id, helveticaBold(14));
				item.x = prev ? prev.x + prev.width + 10 : 0;
				item.mouseChildren = false;
				item.buttonMode = true;
				item.addEventListener(MouseEvent.CLICK, onMenuClick);
				addChild(item);
				prev = item;
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onMenuClick(e : MouseEvent) : void
		{
			this.nugget.navigation.to(BasicText(e.target).text);
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
