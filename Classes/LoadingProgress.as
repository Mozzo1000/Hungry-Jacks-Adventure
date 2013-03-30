package{
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * One of the screen/menu classes, this one is for the loading screen that you will only see if you have really terrible internet.
	 * This one extends Counter for counting how much you have downloaded
	 */
	
	public class LoadingProgress extends Counter{
		public function LoadingProgress(){
			super();
		}
 
		override public function updateDisplay():void{
			super.updateDisplay();
			percentDisplay.text = currentValue.toString();
		}
	}
}