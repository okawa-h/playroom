package utils;

import js.html.CanvasElement;
import js.jquery.JQuery;
import js.three.WebGLRenderer;
import js.three.PerspectiveCamera;
import js.three.Scene;
import js.three.Vector3;
import object.ObjectManager;
import utils.OrbitControlsManager;
import view.Camera;
import view.Window;

class RendererManager {

	private static var _parent : WebGLRenderer;
	private static var _jStage : JQuery;

	/* =======================================================================
    	Constractor
    ========================================================================== */
	public static function init():Void {

		_parent = new WebGLRenderer({ antialias:true });
		_parent.setClearColor( 0x353535, 1 );
		_parent.setPixelRatio(Window.devicePixelRatio());
		_parent.gammaInput  = true;
		_parent.gammaOutput = true;
		_jStage = new JQuery('#stage').append(getElement()).hide();


	}

		/* =======================================================================
			Rendering
		========================================================================== */
		public static function rendering(?time:Float):Void {

			var mouseX : Float = EventManager.mouseX();
			var mouseY : Float = EventManager.mouseY();
			var mouseVector : Vector3 = EventManager.getMouseVector();

			Window.requestAnimationFrame(rendering);
			ObjectManager.onUpdate();

			var camera : PerspectiveCamera = Camera.onUpdate(mouseX,mouseY);
			_parent.render(SceneManager.get(),camera);
			
		}

		/* =======================================================================
			On Resize
		========================================================================== */
		public static function onResize(winW:Float,winH:Float):Void {

			_parent.setSize(winW,winH);

		}

		/* =======================================================================
			Get Element
		========================================================================== */
		public static function getElement():CanvasElement {

			return _parent.domElement;

		}

		/* =======================================================================
			Show
		========================================================================== */
		public static function show():Void {

			_jStage.fadeIn(1000);

		}

}
