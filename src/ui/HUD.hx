package ui;

import h2d.Object;
import h2d.Flow;
import h2d.Graphics;
import h2d.Text;
import hxd.res.DefaultFont;

class HUD extends Object {
    var hpBar:Graphics;
    var hpText:Text;
    var invFlow:Flow;

    public function new(parent:Object) {
        super(parent);
        
        // Top Left: Health
        var hpContainer = new Flow(this);
        hpContainer.layout = Horizontal;
        hpContainer.verticalAlign = Middle;
        hpContainer.padding = 10;
        hpContainer.spacing = 10;
        hpContainer.x = 10;
        hpContainer.y = 10;

        var hpLabel = new Text(DefaultFont.get(), hpContainer);
        hpLabel.text = "HP";
        hpLabel.textColor = Const.UI_TEXT_COLOR;
        hpLabel.dropShadow = { dx: 1, dy: 1, color: 0x000000, alpha: 1 };

        hpBar = new Graphics(hpContainer);
        updateHealth(100, 100);

        // Bottom Center: Inventory mockup
        invFlow = new Flow(this);
        invFlow.layout = Horizontal;
        invFlow.spacing = 5;
        invFlow.padding = 5;
        invFlow.backgroundTile = h2d.Tile.fromColor(0x000000, 1, 1, 0.5);
        
        // Add some dummy slots
        for(i in 0...5) {
            var slot = new Graphics(invFlow);
            slot.beginFill(0x444444);
            slot.drawRect(0, 0, 32, 32);
            slot.endFill();
            slot.lineStyle(1, 0x888888);
            slot.drawRect(0, 0, 32, 32);
        }
    }

    public function resize(w:Int, h:Int) {
        if(invFlow != null) {
            invFlow.x = (w - invFlow.outerWidth) * 0.5;
            invFlow.y = h - invFlow.outerHeight - 20;
        }
    }

    public function updateHealth(current:Float, max:Float) {
        hpBar.clear();
        
        // Background
        hpBar.beginFill(Const.HP_BG_COLOR);
        hpBar.drawRect(0, 0, 200, 20);
        hpBar.endFill();

        // Foreground
        var pct = current / max;
        if(pct < 0) pct = 0;
        if(pct > 1) pct = 1;
        
        hpBar.beginFill(Const.HP_COLOR);
        hpBar.drawRect(0, 0, 200 * pct, 20);
        hpBar.endFill();
        
        // Border
        hpBar.lineStyle(2, 0xFFFFFF);
        hpBar.drawRect(0, 0, 200, 20);
    }
}