package ui;

import h2d.Flow;
import h2d.Text;
import hxd.res.DefaultFont;

class HUD extends Flow {
    
    var scoreText : Text;

    public function new(parent:h2d.Object) {
        super(parent);
        
        // Fix: Flow uses horizontalSpacing/verticalSpacing instead of 'spacing'
        horizontalSpacing = 10;
        verticalSpacing = 10;
        layout = Horizontal;
        padding = 10;
        
        var font = DefaultFont.get();
        scoreText = new Text(font, this);
        scoreText.text = "Score: 0";
    }

    public function updateScore(score:Int) {
        scoreText.text = "Score: " + score;
    }
}