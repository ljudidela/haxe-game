package;

import h2d.Tile;
import h2d.TileGroup;

class Level extends h2d.Object {
    var mapData : Array<Array<Int>>;
    var tiles : TileGroup;
    var floorTile : Tile;
    var wallTile : Tile;

    public function new(parent:h2d.Object) {
        super(parent);
        floorTile = Tile.fromColor(0x222222, Const.TILE_SIZE, Const.TILE_SIZE);
        wallTile = Tile.fromColor(0x555555, Const.TILE_SIZE, Const.TILE_SIZE);
        tiles = new TileGroup(floorTile, this);
        
        generateMap();
    }

    function generateMap() {
        mapData = [];
        for (y in 0...Const.MAP_HEIGHT) {
            var row = [];
            for (x in 0...Const.MAP_WIDTH) {
                // Simple borders
                if (x == 0 || x == Const.MAP_WIDTH - 1 || y == 0 || y == Const.MAP_HEIGHT - 1) {
                    row.push(1); // Wall
                } else {
                    // Random pillars
                    if (Math.random() < 0.1) row.push(1);
                    else row.push(0); // Floor
                }
            }
            mapData.push(row);
        }
        redraw();
    }

    function redraw() {
        tiles.clear();
        for (y in 0...Const.MAP_HEIGHT) {
            for (x in 0...Const.MAP_WIDTH) {
                if (mapData[y][x] == 1) {
                    tiles.add(x * Const.TILE_SIZE, y * Const.TILE_SIZE, wallTile);
                } else {
                    tiles.add(x * Const.TILE_SIZE, y * Const.TILE_SIZE, floorTile);
                }
            }
        }
    }

    public function isWalkable(x:Int, y:Int) : Bool {
        if (x < 0 || x >= Const.MAP_WIDTH || y < 0 || y >= Const.MAP_HEIGHT) return false;
        return mapData[y][x] == 0;
    }

    public function getRandomFloor() : {x:Int, y:Int} {
        while (true) {
            var rx = Std.random(Const.MAP_WIDTH);
            var ry = Std.random(Const.MAP_HEIGHT);
            if (mapData[ry][rx] == 0) return {x: rx, y: ry};
        }
    }
}