import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;

class Entity extends Object {
    public var bmp : Bitmap;

    public function new(parent:Object, x:Float, y:Float, color:Int = 0xFF0000) {
        super(parent);
        this.x = x;
        this.y = y;
        var tile = Tile.fromColor(color, 32, 32);
        tile.dx = -16;
        tile.dy = -16;
        bmp = new Bitmap(tile, this);
    }

    public function destroy() {
        remove();
    }
}