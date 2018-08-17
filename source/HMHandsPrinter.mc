class HMHandsPrinter {

    private var clockTime;

    private var penWidth;

    public function init(arg) {
        clockTime = arg;
        penWidth = 2;
    }

    public function printHMHands(l) {
        printHourHand(l);
        printMinuteHand(l);
    }

    private function printHourHand(l) {
        if (l.success()) {
            var c = l.context();
            var angle = (((clockTime.hour % 12) * 60 + clockTime.min) / (12 * 30.0)) * Math.PI;
            var pts = generateHMHandCoordinates(l.center(), angle, (l.size()[0] / 2) - 44, 10, 8);
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            c.setPenWidth(penWidth);
            c.drawLine(pts[0][0], pts[0][1], pts[1][0], pts[1][1]);
            c.drawLine(pts[1][0], pts[1][1], pts[2][0], pts[2][1]);
            c.drawLine(pts[2][0], pts[2][1], pts[3][0], pts[3][1]);
            c.drawLine(pts[3][0], pts[3][1], pts[0][0], pts[0][1]);
        }
    }

    private function printMinuteHand(l) {
        if (l.success()) {
            var c = l.context();
            var angle = (clockTime.min / 30.0) * Math.PI;
            var pts = generateHMHandCoordinates(l.center(), angle, (l.size()[0] / 2) - 24, 20, 6);
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            c.setPenWidth(penWidth);
            c.drawLine(pts[0][0], pts[0][1], pts[1][0], pts[1][1]);
            c.drawLine(pts[1][0], pts[1][1], pts[2][0], pts[2][1]);
            c.drawLine(pts[2][0], pts[2][1], pts[3][0], pts[3][1]);
            c.drawLine(pts[3][0], pts[3][1], pts[0][0], pts[0][1]);
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
