class DialPrinter {

    private var penWidth;

    private var dndIcon;

    private var btIcon;

    public function initDip() {
        dndIcon = WatchUi.loadResource(Rez.Drawables.DoNotDisturbW);
        btIcon = WatchUi.loadResource(Rez.Drawables.BluetoothMarkW);
    }

    public function printDial(l) {
        penWidth = 2;
        fill(l);
        printHashMarksForRound(l);
        printArbor(l);
        printDndIcon(l);
    }

    private function fill(l) {
        if (l.success()) {
            var c = l.context();
            c.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
            c.fillRectangle(0, 0, l.size()[0], l.size()[1]);
        }
    }

    private function printHashMarksForRound(l) {
        if (l.success()) {
            var c = l.context();

            var outerRad = l.size()[0] / 2;
            var innerRad1 = outerRad - 10;
            var innerRad2 = outerRad - 20;
            var offset = 2;
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            c.setPenWidth(penWidth);
            for (var i = 0; i < 12; ++i) {
                var sX = outerRad + innerRad1 * Math.cos((Math.PI / 6) * i);
                var sXL = outerRad + innerRad2 * Math.cos((Math.PI / 6) * i);
                var eX = outerRad + outerRad * Math.cos((Math.PI / 6) * i);
                var sY = outerRad + innerRad1 * Math.sin((Math.PI / 6) * i);
                var sYL = outerRad + innerRad2 * Math.sin((Math.PI / 6) * i);
                var eY = outerRad + outerRad * Math.sin((Math.PI / 6) * i);
                if (0 == i || 6 == i) {
                    c.drawLine(sXL, sYL - offset, eX, eY - offset);
                    c.drawLine(sXL, sYL + offset, eX, eY + offset);
                } else if (3 == i || 9 == i) {
                    c.drawLine(sXL - offset, sYL, eX - offset, eY);
                    c.drawLine(sXL + offset, sYL, eX + offset, eY);
                } else {
                    c.drawLine(sX, sY, eX, eY);
                }
            }
        }
    }

    private function printArbor(l) {
        if (l.success()) {
            var c = l.context();
            var r = 8;
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            c.setPenWidth(penWidth);
            c.drawCircle(l.center()[0], l.center()[1], r);
        }
    }

    private function printDndIcon(l) {
        if (l.success()) {
            if (System.getDeviceSettings().doNotDisturb) {
                var c = l.context();
                c.drawBitmap(l.size()[0] / 2, (l.size()[1] * 2) / 7, dndIcon);
            }
        }
    }

}
