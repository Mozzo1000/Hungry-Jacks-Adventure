package{
	
	import flash.display.MovieClip;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Base class for counting, extends by a few classes like Score
	 */
	
	public class Counter extends MovieClip{
		
		public var currentValue:Number;
		public var currentBloodValue:Number;
		
		public function Counter(){
			reset();
		}
		
		public function addToValue(amountToAdd:Number):void{
			currentValue = currentValue + amountToAdd;
			updateDisplay();
		}
		
		public function removeToValue(amountToRemove:Number):void{
			currentValue = currentValue - amountToRemove;
			updateDisplay();
		}
		
		public function setValue(amount:Number):void{
			currentValue = amount;
			updateDisplay();
		}
		
		public function reset():void{
			currentValue = 0;
			currentBloodValue = 0;
			updateDisplay();
		}
		
		public function updateDisplay():void{
			
		}
	}
}