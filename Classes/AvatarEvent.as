package{
	
	import flash.events.Event;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Class for registering player events, death and win events for now.
	 */
	
	public class AvatarEvent extends Event{
		
		public static const DEAD:String = "dead";
		public static const WIN:String = "win";
		
		public function AvatarEvent(type:String){
			super(type);
		}
	}
}