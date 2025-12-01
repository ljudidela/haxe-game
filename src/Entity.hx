package;

import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;

class Entity extends Object {
    public var cx : Int;
    public var cy : Int;
    var bmp : Bitmap;
    var game : Game;

    public function new(game:Game, x:Int, y:Int, color:Int, parent:Object) {
        super(parent);
        this.game = game;
        this.cx = x;
        this.cy = y;

        var tile = Tile.fromColor(color, Const.TILE_SIZE, Const.TILE_SIZE);
        bmp = new Bitmap(tile, this);
        
        // Center the sprite visually relative to grid
        updatePos();
    }

    public function updatePos() {
        this.x = cx * Const.TILE_SIZE;
        this.y = cy * Const.TILE_SIZE;
    }

    public function tryMove(dx:Int, dy:Int) : Bool {
        var tx = cx + dx;
        var ty = cy + dy;

        if (!game.level.isWalkable(tx, ty)) return false;
        
        // Check for other entities
        for (e in game.enemies) {
            if (e.cx == tx && e.cy == ty) {
                attack(e);
                return true;
            }
        }

        if (game.player != null && game.player.cx == tx && game.player.cy == ty && this != game.player) {
            attack(game.player);
            return true;
        }

        cx = tx;
        cy = ty;
        updatePos();
        return true;
    }

    public function attack(target:Entity) {
        // Simple attack animation/logic placeholder
        target.bmp.alpha = 0.5;
        haxe.Timer.delay(function() { if(target != null && target.bmp != null) target.bmp.alpha = 1; }, 200);
    }
}