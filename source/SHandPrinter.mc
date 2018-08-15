class SHandPrinter {

    private var w;

    private var h;

    private var c;

    public function tellSize(arg) {
        w = arg[0];
        h = arg[1];
    }

    public function tellCenter(arg) {
        c = arg;
    }

    public function printSHand(dc, clockTime) {
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);

        var s = clockTime.sec;
        var position = [
            [ c[0], c[1] ],
            [ c[0], c[1] ],
            [ c[0], c[1] ],
            [ c[0], c[1] ],
            [ c[0], c[1] ]
        ];
        position = fillPosition(position, s);
        for (var i = 0; i < 5; ++i) {
            if (c[0] != position[i][0] && c[1] != position[i][1]) {
                dc.drawCircle(position[i][0], position[i][1], 3);
            }
        }
    }

    private function fillPosition(p, s) {
        var radius = (w / 2) - 7;
        for (var i = s; i > 0; --i) {
            if (4 < (s - i)) {
                break;
            }
            var angle = (i / 30.0) * Math.PI;
            var cos = Math.cos(angle);
            var sin = Math.sin(angle);
            var x = 0.5 - (-(radius) * sin);
            var y = 0.5 + (-(radius) * cos);
            p[s - i] = [ c[0] + x, c[1] + y ];
        }
        return p;
    }

}
