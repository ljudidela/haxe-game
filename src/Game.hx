package;

import h2d.Scene;
import ui.HUD;

class Game extends Scene {
    
    var level:Level;
    var player:Entity;
    var hud:HUD;
    var entities:Array<Entity>;

    public function new() {
        super();
        
        // Add visual flair: Bloom Filter
        var bloom = new h2d.filter.Glow(0xFFFFFF, 0.5, 1.0);
        bloom.knockout = false;
        this.filter = bloom;

        initGame();
    }

    function initGame() {
        level = new Level(this);
        entities = [];

        // Create Player
        player = new Entity(100, 100, 0x00FF00, this);
        entities.push(player);

        // Create some enemies/objects
        entities.push(new Entity(300, 200, 0xFF0000, this));
        entities.push(new Entity(500, 150, 0x0000FF, this));

        // Initialize HUD on top of everything
        hud = new HUD(this);
    }

    override function update(dt:Float) {
        super.update(dt);
        
        // Simple input handling for player
        var speed = 200 * dt;
        if(hxd.Key.isDown(hxd.Key.W)) player.y -= speed;
        if(hxd.Key.isDown(hxd.Key.S)) player.y += speed;
        if(hxd.Key.isDown(hxd.Key.A)) player.x -= speed;
        if(hxd.Key.isDown(hxd.Key.D)) player.x += speed;

        // Update entities
        for(e in entities) {
            e.update(dt);
        }

        // Update HUD info
        hud.updateHealth(75, 100); // Mock data
        hud.resize(s2d.width, s2d.height);
    }
}