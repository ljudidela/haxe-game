package;

class Main extends hxd.App {
    var game : Game;

    override function init() {
        // Basic Setup
        engine.backgroundColor = 0x000000;
        
        // Add some UI text
        var font = hxd.res.DefaultFont.get();
        var tf = new h2d.Text(font, s2d);
        tf.text = "Fatal Labyrinth Clone - Arrows to Move, Space to Wait";
        tf.textColor = 0xFFFFFF;
        tf.y = 5;
        tf.x = 5;

        // Start Game Scene
        var gameContainer = new h2d.Object(s2d);
        gameContainer.y = 30; // Offset for UI
        game = new Game(gameContainer);
    }

    override function update(dt:Float) {
        if (game != null) game.update(dt);
    }

    static function main() {
        new Main();
    }
}