package{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * One of the screen/menu classes, this one is for the Menu at the begining.
	 */

	public class MenuScreen extends MovieClip{
		public function MenuScreen(){
			Mouse.show();
			startButton.addEventListener(MouseEvent.CLICK, onClickStart);
			WebsiteButton.addEventListener(MouseEvent.CLICK, onClickWebsite);
			TwitterButton.addEventListener(MouseEvent.CLICK, onClickTwitter);
			YouTubeButton.addEventListener(MouseEvent.CLICK, onClickYoutube);
			
		}
		
		public function onClickStart(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.START));
		}
		
		public function onClickWebsite(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.OPENWEBSITEURL));
		}
		
		public function onClickTwitter(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.OPENTWITTERURL));
		}
		
		public function onClickYoutube(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.OPENYOUTUBEURL));
		}
	}
}