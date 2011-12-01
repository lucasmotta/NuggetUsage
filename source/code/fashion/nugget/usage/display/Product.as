package fashion.nugget.usage.display
{

	import fashion.nugget.abstract.AbstractButton;
	import fashion.nugget.display.Border;
	import fashion.nugget.display.Box;
	import fashion.nugget.i18n.spell;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.util.display.safeRemoveAndDispose;
	import fashion.nugget.util.display.safeRemoveChild;
	import fashion.nugget.view.LoadableView;

	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.greensock.events.LoaderEvent;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta
	 */
	public class Product extends LoadableView
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _background : Box;
		
		protected var _border : Border;
		
		protected var _labelText : GlossaryText;
		
		protected var _image : Bitmap;
		
		
		protected var _button : AbstractButton;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Product(labelKey : String, urlKey : String)
		{
			_background = new Box(0xCCCCCC, 200, 100);
			addChild(_background);
			
			_border = new Border(0, _background.width, _background.height, 0);
			addChild(_border);
			
			_labelText = new GlossaryText(labelKey, helveticaBold(14));
			_labelText.y = _background.height + 5;
			addChild(_labelText);
			
			_button = new AbstractButton(_background);
			_button.buttonMode = true;
			_button.addEventListener(MouseEvent.ROLL_OVER, onItemOver);
			_button.addEventListener(MouseEvent.ROLL_OUT, onItemOut);
			_button.addEventListener(MouseEvent.CLICK, onItemClick);
			
			super(spell(urlKey));
			load();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		override protected function onLoadComplete(e : LoaderEvent) : void
		{
			this.image = _loader.rawContent;
		}
		
		protected function onItemOver(e : MouseEvent) : void
		{
			TweenLite.to(_border, .3, { thickness:3, ease:Expo.easeOut } );
		}
		
		protected function onItemOut(e : MouseEvent) : void
		{
			TweenLite.to(_border, .5, { thickness:0, ease:Expo.easeOut } );
		}
		
		protected function onItemClick(e : MouseEvent) : void
		{
			//_button.enabled = false;
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			_labelText = safeRemoveAndDispose(_labelText);
			_background = safeRemoveChild(_background);
			_button.dispose();
			_button = null;
			
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get image() : Bitmap
		{
			return _image;
		}

		public function set image(image : Bitmap) : void
		{
			_image = safeRemoveChild(_image);
			_image = image;
			_image.smoothing = true;
			_image.width = _background.width;
			_image.height = _background.height;
			_background.addChild(_image);
		}


	}
}
