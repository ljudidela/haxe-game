package ui;

import h2d.Scene;
import h2d.Text;
import h2d.Interactive;
import h2d.Flow;
import hxd.res.DefaultFont;

class MainMenu extends Scene {
    
    public function new() {
        super();
        
        var flow = new Flow(this);
        flow.layout = Vertical;
        flow.verticalSpacing = 20;
        flow.fillWidth = true;
        flow.fillHeight = true;
        flow.horizontalAlign = Middle;
        flow.verticalAlign = Middle;

        var title = new Text(DefaultFont.get(), flow);
        title.text = "MY AWESOME GAME";
        title.scale(4);
        title.textColor = Const.UI_ACCENT_COLOR;
        // Simple shadow effect
        title.dropShadow = { dx : 2, dy : 2, color : 0x000000, alpha : 0.8 };

        addButton(flow, "START GAME", function() {
            Main.inst.startGame();
        });

        addButton(flow, "SETTINGS", function() {
            trace("Settings clicked");
        });

        addButton(flow, "EXIT", function() {
            hxd.System.exit();
        });
    }

    function addButton(parent:Flow, label:String, onClick:Void->Void) {
        var bg = new h2d.Object(parent);
        
        var txt = new Text(DefaultFont.get(), bg);
        txt.text = label;
        txt.scale(2);
        
        var interact = new Interactive(txt.textWidth * 2, txt.textHeight * 2, bg);
        interact.onOver = function(_) txt.textColor = Const.UI_ACCENT_COLOR;
        interact.onOut = function(_) txt.textColor = Const.UI_TEXT_COLOR;
        interact.onClick = function(_) onClick();
    }
}