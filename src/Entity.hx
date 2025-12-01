package;

import h2d.Graphics;
import h2d.Object;

class Entity extends Object {
    
    var gfx:Graphics;
    var color:Int;
    var time:Float = 0;

    public function new(x:Float, y:Float, color:Int, parent:Object) {
        super(parent);
        this.x = x;
        this.y = y;
        this.color = color;
        
        drawGraphics();
    }

    function drawGraphics() {
        gfx = new Graphics(this);
        
        // Improve graphics: Gradient-like look using concentric circles
        gfx.beginFill(color, 1.0);
        gfx.drawCircle(0, 0, 16);
        gfx.endFill();

        // Highlight
        gfx.beginFill(0xFFFFFF, 0.3);
        gfx.drawCircle(-4, -4, 6);
        gfx.endFill();
        
        // Border
        gfx.lineStyle(2, 0xFFFFFF, 0.8);
        gfx.drawCircle(0, 0, 16);
    }

    public function update(dt:Float) {
        time += dt;
        // Idle animation: gentle floating/breathing
        gfx.scaleX = 1 + Math.sin(time * 5) * 0.05;
        gfx.scaleY = 1 + Math.cos(time * 5) * 0.05;
    }
}