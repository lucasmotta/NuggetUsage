package fashion.nugget.usage.section
{

	import fashion.nugget.i18n.spell;
	import fashion.nugget.usage.display.Product;
	import fashion.nugget.util.display.safeRemoveAndDispose;
	import fashion.nugget.util.string.printf;
	import fashion.nugget.view.SectionView;

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
			
			for(i = 0; i < length; i++)
			{
				item = new Product(printf("products.product#%(id)s.label", { id:i }), printf("products.product#%(id)s.image", { id:i }));
				item.x = 50 + i * (item.width + 20);
				item.y = 50;
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
