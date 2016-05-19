package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.MouseEvent;
 
	public class Preloader extends Sprite
	{
		/**
		* Alias for stage LoaderInfo instance
		*/
		private var _targetLoaderInfo:LoaderInfo;
 
		/**
		* The percent loaded
		*/
		private var _loadPercent:Number = 0;
 
		/**
		* Constructor
		* Listen for when the preloader has been added to the stage 
		* so that the progress of the remaining load can be monitored.
		*/
		public function Preloader()
		{
			this.addEventListener( Event.ADDED_TO_STAGE , _init );
		}
 
		/**
		* Initialize variables.
		* Set initial width of the progress bar to 0 
		* and listen for enter frame event.
		*/
		private function _init(evt:Event):void
		{
			_targetLoaderInfo = stage.loaderInfo;
			progBar.scaleX = 0;
			this.removeEventListener( Event.ADDED_TO_STAGE , _init );
			this.addEventListener(Event.ENTER_FRAME, _onCheckLoaded);
		}
 
		/**
		* Check the status of the load, once complete dispatch a complete event.
		*/
		private function _onCheckLoaded(evt:Event):void 
		{
			_loadPercent = _targetLoaderInfo.bytesLoaded / _targetLoaderInfo.bytesTotal;
			progBar.scaleX = _loadPercent;
			if (progBar.scaleX == 1)
			{
				this.removeEventListener(Event.ENTER_FRAME, _onCheckLoaded);
				progBar.visible = false;
				this.dispatchEvent( new Event(Event.COMPLETE) );
			}
		}
	}	
}