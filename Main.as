package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
 
	public class Main extends MovieClip 
	{
		/**
		* Constructor
		* Stop timeline and add event listener to preloader.
		*/
		var playButton = new PlayButton();
		
		public function Main() 
		{
			this.stop();
			preloader.addEventListener( Event.COMPLETE , _initContent );
			addChild(playButton);
			playButton.x = 285;
			playButton.y = 441.3;
			playButton.scaleX = .5;
			playButton.scaleY = .5;
			playButton.visible = false;
			playButton.addEventListener(MouseEvent.CLICK, PlayGame);
		}
 
		/**
		* Load has finished, remove preloader and preceed to next frame.
		*/
		private function _initContent(evt:Event):void 
		{
			playButton.visible = true;
		}
		
		function PlayGame(event:MouseEvent):void
		{
			preloader.removeEventListener( Event.COMPLETE , _initContent );
			this.removeChild(preloader);
			nextFrame();
			playButton.removeEventListener(MouseEvent.CLICK, PlayGame);
			removeChild(playButton);
		}
	}
}