import h2d.Object;
import h2d.Text;
import hxd.res.DefaultFont;
import h2d.Interactive;
import Game;

class MainMenu extends Object {
    public function new() {
        super(Game.inst.s2d);
        var font = DefaultFont.get();
        var tf = new Text(font, this);
        tf.text = "CLICK TO START";
        tf.setScale(2);
        tf.x = (Const.SW - tf.textWidth * 2) * 0.5;
        tf.y = (Const.SH - tf.textHeight * 2) * 0.5;

        var interaction = new Interactive(tf.textWidth * 2, tf.textHeight * 2, this);
        interaction.x = tf.x;
        interaction.y = tf.y;
        interaction.onClick = function(_) {
            Game.inst.startGame();
        };
    }

    public function destroy() {
        remove();
    }
}