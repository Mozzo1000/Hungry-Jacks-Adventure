package{
	
	import flash.display.MovieClip;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * A basic MovieClip class for the Stone
	 */
	
	public class Stone extends MovieClip{
		
		/*xSpeed, ySpeed handles how fast the stone will move*/
		var xSpeed:Number;
		var ySpeed:Number;
		
		public function Stone(startX:Number, startY:Number){
			x = startX;
			y = startY;
			
			/*Initializes the speed of the object*/
			xSpeed = 0;
			ySpeed = 2;
		}
		
		/*
		* move Function is for moving the MovieClip(stone) in diffrent axis
		* right now only moving on the y axis
		*/
		public function move():void{
			x = x + xSpeed;
			y = y + ySpeed;
		}
	}
}