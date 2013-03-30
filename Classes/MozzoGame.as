package{
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.media.SoundChannel;
	 
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Main class for handling the game
	 */

	public class MozzoGame extends MovieClip{
		
		public var army:Array;
		public var stoneArray:Array;
		public var islandArray:Array;
		public var islands:Island;
		public var avatar:Avatar;
		public var blood:Blood;
		public var gameTimer:Timer;
		public var useMouseControl:Boolean;
		public var keyDownPressed:Boolean;
		public var keyUpPressed:Boolean;
		public var keyLeftPressed:Boolean;
		public var keyRightPressed:Boolean;
		
		public var backgroundMusic:BackgroundMusic;
		public var bgmSoundChannel:SoundChannel;
		public var soundEatHit:SoundEatHit;
		public var sfxSoundChannel:SoundChannel;
		
		public var currentLevelData:LevelData;
						
		public function MozzoGame(){
			currentLevelData = new LevelData(1);
			
			gameScore.addToValue(10);
			Mouse.hide();
			useMouseControl = false;
			keyDownPressed = false;
			keyUpPressed = false;
			keyLeftPressed = false;
			keyRightPressed = false;
			
			backgroundMusic = new BackgroundMusic();
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener(Event.SOUND_COMPLETE, onBackgroundMusicFinished);
			soundEatHit = new SoundEatHit();
			
			army = new Array();
			stoneArray = new Array();
			islandArray = new Array();
			avatar = new Avatar();
			addChild(avatar);
			
			blood = new Blood();
			
			if(useMouseControl){
				avatar.x = mouseX;
				avatar.y = mouseY;
			}else{
				avatar.x = 375;
				avatar.y = 550;
			}
			
			
			gameTimer = new Timer(25);
			gameTimer.addEventListener(TimerEvent.TIMER, onTick);
			gameTimer.start();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		public function onBackgroundMusicFinished( event:Event ):void{
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener(Event.SOUND_COMPLETE, onBackgroundMusicFinished);
		}
		
		public function onAddToStage(event:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		}
		
		public function onKeyPressed(keyEvent:KeyboardEvent):void{
			if(keyEvent.keyCode == Keyboard.DOWN){
				keyDownPressed = true;
			}else if(keyEvent.keyCode == Keyboard.UP){
				keyUpPressed = true;
			}else if(keyEvent.keyCode == Keyboard.LEFT){
				keyLeftPressed = true;
			}else if(keyEvent.keyCode == Keyboard.RIGHT){
				keyRightPressed = true;
			}
			
			if(keyEvent.keyCode == Keyboard.S){
				keyDownPressed = true;
			}else if(keyEvent.keyCode == Keyboard.W){
				keyUpPressed = true;
			}else if(keyEvent.keyCode == Keyboard.A){
				keyLeftPressed = true;
			}else if(keyEvent.keyCode == Keyboard.D){
				keyRightPressed = true;
			}
		}
		
		public function onKeyReleased(keyEvent:KeyboardEvent):void{
			if(keyEvent.keyCode == Keyboard.DOWN){
				keyDownPressed = false;
			}else if(keyEvent.keyCode == Keyboard.UP){
				keyUpPressed = false;
			}else if(keyEvent.keyCode == Keyboard.LEFT){
				keyLeftPressed = false;
			}else if(keyEvent.keyCode == Keyboard.RIGHT){
				keyRightPressed = false;
			}
			
			if(keyEvent.keyCode == Keyboard.S){
				keyDownPressed = false;
			}else if(keyEvent.keyCode == Keyboard.W){
				keyUpPressed = false;
			}else if(keyEvent.keyCode == Keyboard.A){
				keyLeftPressed = false;
			}else if(keyEvent.keyCode == Keyboard.D){
				keyRightPressed = false;
			}
		}
		
		public function onTick(timerEvent:TimerEvent):void{
			if(Math.random() < currentLevelData.enemySpawnRate){
				var randomX:Number = Math.random() * 800;
				var newEnemy:Enemy = new Enemy(randomX, -60);
				army.push(newEnemy);
				addChild(newEnemy);
			}
			
			if(Math.random() < currentLevelData.stoneSpawnRate){
				var randomXStone:Number = Math.random() * 800;
				var newStone:Stone = new Stone(randomXStone, -60);
				stoneArray.push(newStone);
				addChild(newStone);
			}
			
			if(Math.random() < 0.01 && getFinalScore() >= 1500){
				var randomXIsland:Number = Math.random() * 800;
				var newIsland:Island = new Island(randomXIsland, -60);
				islandArray.push(newIsland);
				addChild(newIsland);
			}
			
			if(useMouseControl){
				avatar.x = mouseX;
				avatar.y = mouseY;
			}else{
				//Keyboard code
				if(keyDownPressed){
					//avatar.move(0, 1);
				}else if(keyUpPressed){
					//avatar.move(0, -1);
				}else if(keyLeftPressed){
					avatar.move(-1, 0);
				}else if(keyRightPressed){
					avatar.move(1, 0);
				}
			}
			
			//800x600 is the game screen size.
			if(avatar.x < (avatar.width / 2)){
				avatar.x = avatar.width / 2;
			}
			if(avatar.x > 750 - (avatar.width / 2)){
				avatar.x = 750 - (avatar.width / 2);
			}
			if(avatar.y < (avatar.height / 2)){
				avatar.y = avatar.height / 2;
			}
			if(avatar.y > 600 - (avatar.height / 2)){
				avatar.y = 600 - (avatar.height / 2);
			}
			
			var avatarHasHit:Boolean = false;
			var avatarStoneHit:Boolean = false;
			var avatarIslandHit:Boolean = false;
			var enemy:Enemy;
			var stones:Stone;
			var island:Island;
			var i:int = army.length -1;
			var ic:int = stoneArray.length -1;
			var isc:int = islandArray.length -1;
			
			while(isc > -1){
				island = islandArray[isc]
				island.move();
				
				if(CollisionDetection.isColliding(avatar, island, this, true)){
					avatarIslandHit = true;
				}
				
				if(avatarIslandHit){
					dispatchEvent(new AvatarEvent(AvatarEvent.WIN));
					bgmSoundChannel.stop();
					removeChild(island);
					gameTimer.stop();
					islandArray.splice(isc, 1);
				}else if(island.y >= 599){
					removeChild(island);
					islandArray.splice(isc, 1);
				}
				
				isc = isc - 1;
			}
			
			while(ic > -1){
				stones = stoneArray[ic];
				stones.move();
				
				if(CollisionDetection.isColliding(avatar, stones, this, true)){
					avatarStoneHit = true;
				}
				
				if(avatarStoneHit){
					dispatchEvent(new AvatarEvent(AvatarEvent.DEAD));
					removeChild(stones);
					stoneArray.splice(ic, 1);
					bgmSoundChannel.stop();
					gameTimer.stop();
				}else if(stones.y >= 599){
					removeChild(stones);
					stoneArray.splice(ic, 1);
				}
				ic = ic - 1;
			}
			
			while(i > -1){
				enemy = army[i];
				enemy.move();				
				
				if(CollisionDetection.isColliding(avatar, enemy, this, true)){
					avatarHasHit = true;
				}
				
				if(avatarHasHit){
					addChild(blood);
					sfxSoundChannel = soundEatHit.play();
					blood.x = Math.random() * 400;
					blood.y = Math.random() * 300;
					gameScore.addToValue(10);
					//dispatchEvent(new AvatarEvent(AvatarEvent.DEAD));
					removeChild(enemy);
					army.splice(i, 1);
					
				}else if(enemy.y >= 599){
					removeChild(enemy);
					army.splice(i, 1);
					gameScore.removeToValue(5);
				}
				i = i - 1;
				
				if(gameScore.currentValue <= 5){
					dispatchEvent(new AvatarEvent(AvatarEvent.DEAD));
					gameScore.addToValue(1000);
					bgmSoundChannel.stop();
					sfxSoundChannel.stop();
					gameTimer.stop();
				}
				
				if(gameScore.currentValue >= currentLevelData.pointsToReachNextLevel){
					currentLevelData = new LevelData( currentLevelData.levelNum + 1 );
				}
			}
		}
		
		public function getFinalScore():Number{
			return gameScore.currentValue;
		}
	}
}