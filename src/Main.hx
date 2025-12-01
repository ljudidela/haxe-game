import hxd.App;

class Main extends App {
    override function init() {
        // hxd.Res.initEmbed(); // Disabled to avoid missing asset errors
        new Game(s2d);
    }

    static function main() {
        new Main();
    }
}