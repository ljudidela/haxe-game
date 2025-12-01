import h2d.Object;
import h2d.Text;
import hxd.res.DefaultFont;
import Game;

class HUD extends Object {
    var tf : Text;

    public function new() {
        super(Game.inst.s2d);
        var font = DefaultFont.get();
        tf = new Text(font, this);
        tf.text = "Score: 0";
        tf.setPosition(10, 10);
    }

    public function destroy() {
        remove();
    }
}