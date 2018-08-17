using Toybox.Time;
using Toybox.Time.Gregorian;

class DatePrinter {

    public function printDate(l) {
        if (l.success()) {
            var d = Gregorian.info(Time.now(), Time.FORMAT_LONG);
            var s = Lang.format("$1$ $2$ $3$", [ d.day_of_week, d.month, d.day ]);
            var c = l.context();
            c.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            c.drawText(l.size()[0] / 2, (l.size()[1] * 3) / 5, Graphics.FONT_SMALL, s, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

}
