import h2d.Object;
import Game;

class Level extends Object {
    var entities : Array<Entity> = [];

    public function new() {
        super(Game.inst.s2d);
        var player = new Entity(this, Const.SW * 0.5, Const.SH * 0.5, 0x00FF00);
        entities.push(player);
    }

    public function destroy() {
        remove();
    }
}