import h2d.Scene;
import ui.MainMenu;
import ui.HUD;

class Game {
    public static var inst : Game;
    public var s2d : Scene;
    public var level : Level;
    public var hud : HUD;
    public var menu : MainMenu;

    public function new(s2d:Scene) {
        inst = this;
        this.s2d = s2d;
        startMenu();
    }

    public function startMenu() {
        if(level != null) level.destroy();
        if(hud != null) hud.destroy();
        menu = new MainMenu();
    }

    public function startGame() {
        if(menu != null) menu.destroy();
        level = new Level();
        hud = new HUD();
    }
}