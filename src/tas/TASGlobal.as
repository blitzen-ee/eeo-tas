package tas 
{
	import flash.utils.ByteArray;
	import flash.net.FileReference;
	public class TASGlobal 
	{
		
		public static var ticksEnabled:Boolean = true;
		public static var steps:int = 0;
		
		public static var userInputs:ByteArray = null;
		public static var eetasInput:ByteArray = null;
		
		public static var endofTAS:Boolean = true;
		public static var replaying:Boolean = false;
		public static var isSegment:Boolean = false;
		
		public static var getTASInput:Boolean = false;
		
		public static var loadedTAS:FileReference = new FileReference();
	}

}