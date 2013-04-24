package{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * The DocumentClass handles when a "scene" should be visible.
	 */
	
	public class DocumentClass extends MovieClip{
		
		public var playScreen:MozzoGame;
		public var gameOverScreen:GameOverScreen;
		public var winScreen:WinScreen;
		public var menuScreen:MenuScreen;
		public var splashScreen:SplashScreen;
		public var loadingProgress:LoadingProgress;
		
		private var timer:Timer = new Timer(3000);
		
		var urlWebsite:URLRequest = new URLRequest("http://www.mozzo.host56.com");
		var urlTwitter:URLRequest = new URLRequest("http://www.twitter.com/Mozzo__");
		var urlYoutube:URLRequest = new URLRequest("http://www.youtube.com/user/MrAdde12");
		
		public function DocumentClass(){
			
			loadingProgress = new LoadingProgress();
			loadingProgress.x = 300;
			loadingProgress.y = 200;
			addChild( loadingProgress );
			
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteDownload);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressMade);
			stage.stageFocusRect = false;
		}
		
		public function onCompleteDownload(event:Event):void{
			gotoAndStop(3);
			
			timer.addEventListener(TimerEvent.TIMER, splashScreenEnd);
			timer.start();
			
			showSplashScreen();
			//showMenu();
		}
		
		public function onProgressMade(progressEvent:ProgressEvent):void{
			//trace( Math.floor( 100 * loaderInfo.bytesLoaded / loaderInfo.bytesTotal ) );
			loadingProgress.setValue(Math.floor(100*loaderInfo.bytesLoaded / loaderInfo.bytesTotal));
		}
		
		public function splashScreenEnd(event:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER, splashScreenEnd);
			timer.stop();
			splashScreen = null;
			showMenu();
		}
		
		public function showSplashScreen():void{
			splashScreen = new SplashScreen();
			splashScreen.x = 0;
			splashScreen.y = 0;
			addChild(splashScreen);
		}
		
		public function showMenu():void{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener(NavigationEvent.START, onRequestStart);
			menuScreen.addEventListener(NavigationEvent.OPENWEBSITEURL, onRequestOpenWebsite);
			menuScreen.addEventListener(NavigationEvent.OPENTWITTERURL, onRequestOpenTwitter);
			menuScreen.addEventListener(NavigationEvent.OPENYOUTUBEURL, onRequestOpenYoutube);
			menuScreen.x = 0;
			menuScreen.y = 0;
			addChild(menuScreen);
		}
		
		public function onAvatarDeath(avatarEvent:AvatarEvent):void{
			var finalScore:Number = playScreen.getFinalScore();
			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener(NavigationEvent.RESTART, onRequestRestart);
			gameOverScreen.x = 0;
			gameOverScreen.y = 0;
			gameOverScreen.setFinalScore(finalScore);
			addChild(gameOverScreen);
			playScreen = null;
		}
		
		public function onAvatarWin(avatarEvent:AvatarEvent):void{
			var finalScore:Number = playScreen.getFinalScore();
			winScreen = new WinScreen();
			winScreen.addEventListener(NavigationEvent.RESTART, onRequestRestart);
			winScreen.x = 0;
			winScreen.y = 0;
			winScreen.setFinalScore(finalScore);
			addChild(winScreen);
			playScreen = null;
		}
		
		public function restartGame():void{
			playScreen = new MozzoGame();
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			playScreen.addEventListener(AvatarEvent.WIN, onAvatarWin); //New Line!
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
			gameOverScreen = null;
		}
		
		public function onRequestRestart(navigationEvent:NavigationEvent):void{
			restartGame();
		}
		
		public function onRequestStart(navigationEvent:NavigationEvent):void{
			playScreen = new MozzoGame();
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			playScreen.addEventListener(AvatarEvent.WIN, onAvatarWin); //New Line!
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
			
			removeChild(menuScreen);
			menuScreen = null;
			
			stage.focus = playScreen;
		}
		
		public function onRequestOpenWebsite(navigationEvent:NavigationEvent):void{
			navigateToURL(urlWebsite, "_blank");
		}
		
		public function onRequestOpenTwitter(navigationEvent:NavigationEvent):void{
			navigateToURL(urlTwitter, "_blank");
		}
		
		public function onRequestOpenYoutube(navigationEvent:NavigationEvent):void{
			navigateToURL(urlYoutube, "_blank");
		}
	}
}