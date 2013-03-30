package{
	
	import flash.text.TextField;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Extends counter to count up or down the score you get in game.
	 */
	
	public class Score extends Counter{
		
		public function Score(){
			super();
		}
		
		override public function updateDisplay():void{
			super.updateDisplay();
			scoreDisplay.text = currentValue.toString();
		}
	}
}