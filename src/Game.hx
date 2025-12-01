package;

import hxd.Key;

class Game extends h2d.Object {
    public var level : Level;
    public var player : Entity;
    public var enemies : Array<Entity>;
    var turnLocked : Bool = false;

    public function new(parent:h2d.Object) {
        super(parent);
        startNewGame();
    }

    function startNewGame() {
        if (level != null) level.remove();
        level = new Level(this);

        if (enemies != null) for(e in enemies) e.remove();
        enemies = [];

        var startPos = level.getRandomFloor();
        if (player != null) player.remove();
        // Player is Blue
        player = new Entity(this, startPos.x, startPos.y, 0x0000FF, this);

        // Spawn some enemies (Red)
        for (i in 0...5) {
            var pos = level.getRandomFloor();
            // Ensure not on player
            if (pos.x == startPos.x && pos.y == startPos.y) continue;
            var enemy = new Entity(this, pos.x, pos.y, 0xFF0000, this);
            enemies.push(enemy);
        }
    }

    public function update(dt:Float) {
        if (turnLocked) return;

        var dx = 0;
        var dy = 0;

        if (Key.isPressed(Key.UP)) dy = -1;
        else if (Key.isPressed(Key.DOWN)) dy = 1;
        else if (Key.isPressed(Key.LEFT)) dx = -1;
        else if (Key.isPressed(Key.RIGHT)) dx = 1;
        else if (Key.isPressed(Key.SPACE)) {} // Wait turn
        else return; // No input

        // Player Turn
        var moved = true;
        if (dx != 0 || dy != 0) {
            moved = player.tryMove(dx, dy);
        }

        if (moved) {
            processEnemyTurns();
        }
    }

    function processEnemyTurns() {
        turnLocked = true;
        // Simple AI: Move towards player
        for (e in enemies) {
            var dx = 0;
            var dy = 0;
            if (e.cx < player.cx) dx = 1;
            else if (e.cx > player.cx) dx = -1;
            else if (e.cy < player.cy) dy = 1;
            else if (e.cy > player.cy) dy = -1;

            // Try primary direction, if fail, try random
            if (!e.tryMove(dx, dy)) {
                // Dumb fallback
                e.tryMove(Std.random(3)-1, Std.random(3)-1);
            }
        }
        
        // Small delay for visual pacing if needed, or instant
        turnLocked = false;
    }
}