package fashion.nugget.usage.section
{

	import fashion.nugget.util.display.safeRemoveAndDispose;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.view.SectionView;
	
	
	public class Home extends SectionView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _header : GlossaryText;
		
		protected var _caption : GlossaryText;
		
		protected var _text : GlossaryText;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Home()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			_header = new GlossaryText("home.header", helveticaBold(24));
			_header.x = _header.y = 50;
			addChild(_header);
			
			_caption = new GlossaryText("home.caption", helveticaBold(18));
			_caption.x = _header.x;
			_caption.y = _header.y + _header.height;
			addChild(_caption);
			
			_text = new GlossaryText("home.body", helveticaBold(13, 0, 8));
			_text.x = _caption.x;
			_text.y = _caption.y + _caption.height + 30;
			_text.width = 900;
			_text.multiline = true;
			addChild(_text);
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			_header = safeRemoveAndDispose(_header);
			_caption = safeRemoveAndDispose(_caption);
			_text = safeRemoveAndDispose(_text);
			
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
