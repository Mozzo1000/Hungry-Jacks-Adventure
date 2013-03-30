package{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * One of the screen/menu classes, this one is for Game Over.
	 */

	public class GameOverScreen extends MovieClip{
		public function GameOverScreen(){
			Mouse.show();
			restartButton.addEventListener(MouseEvent.CLICK, onClickRestart);
		}
		
		public function onClickRestart(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.RESTART));
		}
		
		public function setFinalScore(scoreValue:Number):void{
			finalScore.text = scoreValue.toString();
		}
	}
}