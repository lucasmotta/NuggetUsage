package fashion.nugget.usage.text
{

	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta
	 */
	public function helveticaBold(size : int, color : int = 0x000000, lineHeight : int = 4) : TextFormat
	{
		return new TextFormat(FontLibrary.HELVETICA_BOLD, size, color, null, null, null, null, null, null, null, null, null, lineHeight);
	}
}
