package ui;

import h2d.Flow;
import h2d.Text;

class HUD extends Flow {
    var debugText : Text;

    public function new(parent:h2d.Object) {
        super(parent);
        // Fixed: Flow does not have 'spacing' field, use horizontalSpacing/verticalSpacing
        horizontalSpacing = 10;
        verticalSpacing = 10;
        padding = 10;
        layout = Vertical;

        var font = hxd.res.DefaultFont.get();
        debugText = new Text(font, this);
        debugText.text = "HUD";
    }

    public function update(dt:Float) {
        // HUD update logic
    }
}