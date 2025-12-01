package;

import hxd.App;

class Main extends App {
    
    public static var inst:Main;

    override function init() {
        inst = this;
        s2d.scaleMode = ScaleMode.LetterBox(Const.SCREEN_WIDTH, Const.SCREEN_HEIGHT);
        
        // Start with Menu
        setScene(new ui.MainMenu());
    }

    public function startGame() {
        setScene(new Game());
    }

    static function main() {
        new Main();
    }
}