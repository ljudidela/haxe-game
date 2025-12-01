package;

import h2d.Scene;
import ui.HUD;

class Game extends Scene {
    var level : Level;
    var hud : HUD;

    public function new() {
        super();
        // Fixed: s2d is not available in Scene context directly (use this or addChild)
        level = new Level();
        addChild(level);

        hud = new HUD(this);
    }

    // Fixed: Removed 'override' as h2d.Scene does not have an update method
    public function update(dt:Float) {
        if (level != null) level.update(dt);
        if (hud != null) hud.update(dt);
    }
}