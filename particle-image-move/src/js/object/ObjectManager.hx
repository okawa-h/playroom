package object;

import object.*;

class ObjectManager {

	/* =======================================================================
    	Constractor
    ========================================================================== */
	public static function init():Void {

	}

		/* =======================================================================
	    	Create
	    ========================================================================== */
		public static function create():Void {

			Particle.create();

		}

		/* =======================================================================
			On Resize
		========================================================================== */
		public static function onUpdate():Void {

			Particle.onUpdate();

		}

}
