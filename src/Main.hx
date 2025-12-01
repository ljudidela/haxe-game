import hxd.App;
import ui.MainMenu;

class Main extends App {
	override function init() {
		setScene(new MainMenu());
	}

	static function main() {
		new Main();
	}
}