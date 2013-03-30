package{
	
	import flash.events.Event;
	
	 /*
	 * @author Mozzo, http://mozzo.host56.com
	 * Class for registering button events, restart and start events for now.
	 */
	
	public class NavigationEvent extends Event{
		
		public static const RESTART:String = "restart";
		public static const START:String = "start";
		public static const OPENWEBSITEURL:String = "url_website";
		public static const OPENTWITTERURL:String = "url_twitter";
		public static const OPENYOUTUBEURL:String = "url_youtube";
		
		public function NavigationEvent(type:String){
			super(type);
		}
	}
}