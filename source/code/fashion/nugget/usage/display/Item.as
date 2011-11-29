package fashion.nugget.usage.display
{

	import fashion.nugget.text.GlossaryText;
	import fashion.nugget.usage.text.helveticaBold;

	/**
	 * @author Lucas Motta
	 */
	public class Item extends GlossaryText
	{
		
		protected var _value : String;
		
		public function Item(key : String, value : String = null)
		{
			_value = value;
			
			this.mouseChildren = false;
			this.buttonMode = true;
			
			super(key, helveticaBold(14), null);
		}

		public function get value() : String
		{
			return _value;
		}

		public function set value(value : String) : void
		{
			_value = value;
		}
	}
}
