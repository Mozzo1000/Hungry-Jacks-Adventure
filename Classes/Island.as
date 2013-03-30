package{
	import flash.display.MovieClip;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * A basic MovieClip class for the Island.
	 */
	
	public class Island extends MovieClip{
		
		/*xSpeed, ySpeed handles how fast the island will move*/
		var xSpeed:Number;
		var ySpeed:Number;
		
		public function Island(startX:Number, startY:Number):void{
			x = startX;
			y = startY;
			
			/*Initializes the speed of the object*/
			xSpeed = 0;
			ySpeed = 3;
		}
		
		/*
		* move Function is for moving the MovieClip(island) in diffrent axis
		* right now only moving on the y axis
		*/
		public function move():void{
			x = x + xSpeed;
			y = y + ySpeed;
		}
	}
}