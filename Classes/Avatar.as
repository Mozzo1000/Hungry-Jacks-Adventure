package{
	
	import flash.display.MovieClip;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * A basic MovieClip class for the Player itself.
	 */
	
	public class Avatar extends MovieClip{
		public function Avatar(){
			
		}
		
		/*
		* move Function is for moving the MovieClip(player) in diffrent axis
		*/
		public function move(xDistance:Number, yDistance:Number):void{
			var baseSpeed:Number = 6;
			
			x += (xDistance * baseSpeed);
			y += (yDistance * baseSpeed);
		}
	}
}