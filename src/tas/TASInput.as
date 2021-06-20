package tas 
{
	import Global;
	
	public class TASInput 
	{
		public var jump:Boolean = false;
		// public var jumpJustDown:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		public var down:Boolean = false;
		public var up:Boolean = false;
		
		public var offset:int = 48;
		
		public function TASInput() 
		{
			
		}
		
		public function readInputs():void {
			if (TASGlobal.eetasInput == null) {
				return;
			}
			
			var inputsOnTick:int = TASGlobal.eetasInput.readByte();
			inputsOnTick -= offset;
			
			jump = (inputsOnTick & 1) ? true : false;
			left = ((inputsOnTick >> 1) & 1) ? true : false;
			right = ((inputsOnTick >> 2) & 1) ? true : false;
			up = ((inputsOnTick >> 3) & 1) ? true : false;
			down = ((inputsOnTick >> 4) & 1) ? true : false;
		}
		
		public function writeInputs():void {
			var outputByte:int = 0;
			
			if (left != 0) left = 1;
			
			if (right != 0) right = 1;
			
			if (up != 0) up = 1;
			
			if (down != 0) down = 1;
			
			// pack the byte
			outputByte |= (jump) ? 1 : 0;
			outputByte |= (left << 1);
			outputByte |= (right << 2);
			outputByte |= (up << 3);
			outputByte |= (down << 4);
			
			outputByte += offset;
			
			if (TASGlobal.userInputs == null) {
				return;
			}
			
			TASGlobal.userInputs.writeByte(outputByte);
		}
		
	}

}