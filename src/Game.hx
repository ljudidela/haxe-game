import h2d.Scene;
import ui.HUD;

class Game extends Scene {
    
    var level : Level;
    var hud : HUD;

    public function new() {
        super();
        init();
    }

    function init() {
        // Fix: Use 'this' instead of 's2d' when extending Scene
        level = new Level(this);
        hud = new HUD(this);
    }

    // Fix: Removed 'override' as h2d.Scene does not have an update method
    public function update(dt:Float) {
        // Update logic here
    }

    override function onRemove() {
        super.onRemove();
    }
}