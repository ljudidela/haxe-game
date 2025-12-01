package ui;

import h2d.Flow;
import h2d.Text;
import hxd.Res;
import Const;

class MainMenu extends h2d.Scene {

	public function new() {
		super();
		init();
	}

	function init() {
		var flow = new Flow(this);
		flow.layout = Vertical;
		flow.verticalSpacing = 20;
		flow.fillWidth = true;
		flow.fillHeight = true;
		flow.horizontalAlign = Middle;
		flow.verticalAlign = Middle;

		var title = new Text(hxd.res.DefaultFont.get(), flow);
		title.text = "GAME TITLE";
		title.textColor = Const.UI_ACCENT_COLOR;
		title.scale(2);

		addBtn(flow, "START", function() {
			trace("Start Game");
		});

		addBtn(flow, "EXIT", function() {
			hxd.System.exit();
		});
	}

	function addBtn(parent:Flow, label:String, onClick:Void->Void) {
		var btn = new Flow(parent);
		btn.padding = 10;
		btn.backgroundTile = h2d.Tile.fromColor(0x333333, 200, 50);
		
		var tf = new Text(hxd.res.DefaultFont.get(), btn);
		tf.text = label;
		tf.textColor = Const.UI_TEXT_COLOR;
		
		// Interactive wrapper
		var interact = new h2d.Interactive(200, 50, btn);
		interact.onClick = function(_) onClick();
		// Ensure interactive matches flow size/position if needed, 
		// but putting it inside flow works if size is explicit or calculated.
		// For flow, cleaner to make the flow itself interactive-aware or wrap.
		// Here we just overlay.
		btn.getProperties(btn).minWidth = 200;
		btn.getProperties(btn).minHeight = 50;
		btn.getProperties(btn).horizontalAlign = Middle;
		btn.getProperties(btn).verticalAlign = Middle;
	}
}