package{
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Class for handling all levels and how levels change gameplay.
	 */
	
	public class LevelData{
		
		/*How many points to next level*/
		public var pointsToReachNextLevel:Number;
		/*How many enemys(fishes) will spawn*/
		public var enemySpawnRate:Number;
		/*How many stones will spawn*/
		public var stoneSpawnRate:Number;
		/*The accessible level number*/
		public var levelNum:Number;
		
		public function LevelData(levelNumber:Number):void{
			levelNum = levelNumber;
			
			if(levelNumber == 1){
				pointsToReachNextLevel = 150;
				enemySpawnRate = 0.05;
				stoneSpawnRate = 0.01;
			}else if(levelNumber == 2){
				pointsToReachNextLevel = 250;
				enemySpawnRate = 0.08;
				stoneSpawnRate = 0.02;
			}else if(levelNumber == 3){
				pointsToReachNextLevel = 500;
				enemySpawnRate = 0.10;
				stoneSpawnRate = 0.03;
			}else if(levelNumber == 4){
				pointsToReachNextLevel = 800;
				enemySpawnRate = 0.12;
				stoneSpawnRate = 0.04;
			}else if(levelNumber == 5){
				pointsToReachNextLevel = 1000;
				enemySpawnRate = 0.15;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 6){
				pointsToReachNextLevel = 1250;
				enemySpawnRate = 0.20;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 7){
				pointsToReachNextLevel = 1600;
				enemySpawnRate = 0.22;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 8){
				pointsToReachNextLevel = 2000;
				enemySpawnRate = 0.26;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 9){
				pointsToReachNextLevel = 2250;
				enemySpawnRate = 0.30;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 10){
				pointsToReachNextLevel = 2500;
				enemySpawnRate = 1.0;
				stoneSpawnRate = 0.05;
			}else if(levelNumber == 11){
				pointsToReachNextLevel ==999999;
				enemySpawnRate = 1.2;
				stoneSpawnRate = 0.05;
			}
		}
	}
}