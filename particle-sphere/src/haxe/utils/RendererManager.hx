package utils;

import js.html.CanvasElement;
import js.three.WebGLRenderer;
import js.three.Renderer;
import js.three.PerspectiveCamera;
import js.three.Vector3;
import view.ObjectManager;
import view.Camera;

class RendererManager {

	private static var _parent : Renderer;

	/* =======================================================================
    	Constractor
    ========================================================================== */
	public static function init():Void {

		_parent = new WebGLRenderer();
		untyped _parent.setClearColor( 0x01608C);

	}

		/* =======================================================================
			Rendering
		========================================================================== */
		public static function rendering(?time:Float):Void {

			var mouseX : Float = EventManager.mouseX();
			var mouseY : Float = EventManager.mouseY();
			var mouseVector : Vector3 = EventManager.getMouseVector();

			EventManager.onUpdate(rendering);
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

}
