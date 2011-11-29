package fashion.nugget.usage.section
{

	import fashion.nugget.i18n.spell;
	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.display.Product;
	import fashion.nugget.usage.text.helveticaBold;
	import fashion.nugget.util.display.safeRemoveAndDispose;
	import fashion.nugget.util.string.printf;
	import fashion.nugget.view.SectionView;

	import com.greensock.TweenLite;

	/**
	 * @author Lucas Motta
	 */
	public class Products extends SectionView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _header : GlossaryText;
		
		protected var _caption : GlossaryText;
		
		
		protected var _products : Vector.<Product>;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Products()
		{
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			var i : int;
			var list : XMLList =  spell("products.product");
			var length : int = list.length();
			var item : Product;
			
			_products = new Vector.<Product>();
			
			_header = new GlossaryText("products.header", helveticaBold(24));
			_header.x = _header.y = 50;
			addChild(_header);
			
			_caption = new GlossaryText("products.caption", helveticaBold(18, 0x999999));
			_caption.x = _header.x;
			_caption.y = _header.y + _header.height;
			addChild(_caption);
			
			for(i = 0; i < length; i++)
			{
				item = new Product(printf("products.product#%f.label", i), printf("products.product#%f.image", i));
				item.x = 50 + i * (item.width + 20);
				item.y = _caption.y + _caption.height + 30;
				addChild(item);
				_products.push(item);
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function transitionIn() : void
		{
			this.alpha = 0;
			TweenLite.to(this, 1, { alpha:1, onComplete:transitionInComplete } );
		}
		
		override public function transitionOut() : void
		{
			TweenLite.to(this, .5, { alpha:0, onComplete:transitionOutComplete } );
		}
		
		override public function dispose() : void
		{
			if(_products)
			{
				for each(var item : Product in _products)
				{
					item = safeRemoveAndDispose(item);
				}
				_products = null;
			}
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
	}
}
