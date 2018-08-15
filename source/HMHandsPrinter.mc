class HMHandsPrinter {

    private var clockTime;

    public function init(arg) {
        clockTime = arg;
    }

    public function printHMHands(l) {
        printHourHand(l);
        printMinuteHand(l);
    }

    private function printHourHand(l) {
        if (l.success()) {
            var c = l.context();
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            var angle = (((clockTime.hour % 12) * 60 + clockTime.min) / (12 * 30.0)) * Math.PI;
            c.fillPolygon(generateHMHandCoordinates(l.center(), angle, 45, 0, 2));
        }
    }

    private function printMinuteHand(l) {
        if (l.success()) {
            var c = l.context();
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            var angle = (clockTime.min / 30.0) * Math.PI;
            c.fillPolygon(generateHMHandCoordinates(l.center(), angle, 70, 0, 2));
        }
    }

    private function generateHMHandCoordinates(center, angle, handLength, tailLength, handWidth) {
        var coords = [
            [ -(handWidth / 2), tailLength ],
            [ -(handWidth / 2), -(handLength) ],
            [ handWidth / 2, -(handLength) ],
            [ handWidth / 2, tailLength ]
        ];

        var cos = Math.cos(angle);
        var sin = Math.sin(angle);

        var ret = new [ 4 ];
        for (var i = 0; i < 4; ++i) {
            var x = (coords[i][0] * cos) - (coords[i][1] * sin) + 0.5;
            var y = (coords[i][0] * sin) + (coords[i][1] * cos) + 0.5;
            ret[i] = [ center[0] + x, center[1] + y ];
        }

        return ret;
    }

}
