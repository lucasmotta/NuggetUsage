package fashion.nugget.usage.display
{

	import fashion.nugget.util.display.safeRemoveAndDispose;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.display.Box;
	import fashion.nugget.i18n.spell;
	import fashion.nugget.util.display.safeRemoveChild;
	import fashion.nugget.view.LoadableView;

	import com.greensock.events.LoaderEvent;

	import flash.display.Bitmap;

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
		protected var _image : Bitmap;
		
		protected var _background : Box;
		
		protected var _labelText : GlossaryText;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Product(labelKey : String, urlKey : String)
		{
			_background = new Box(0, 200, 100);
			addChild(_background);
			
			_labelText = new GlossaryText(labelKey, helveticaBold(12));
			_labelText.y = _background.height + 5;
			addChild(_labelText);
			
			super(spell(urlKey));
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

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			_labelText = safeRemoveAndDispose(_labelText);
			_background = safeRemoveChild(_background);
			
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
			addChild(_image);
		}


	}
}
