using Toybox.Time;
using Toybox.Time.Gregorian;

class DatePrinter {

    private var fColor;

    private var bColor;

    public function print(l) {
        setColorsToPrint();
        if (l.success()) {
            //var d = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
            //var s = Lang.format("$1$ $2$ $3$", [ dowToString(d.day_of_week), monthToString(d.month), d.day ]);
            var d = Gregorian.info(Time.now(), Time.FORMAT_LONG);
            var s = Lang.format("$1$ $2$ $3$", [ d.day_of_week, d.month, d.day ]);
            var c = l.context();
            c.setColor(fColor, bColor);
            c.drawText(l.center()[0], 0, Graphics.FONT_SMALL, s, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function setColorsToPrint() {
        if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
            fColor = Graphics.COLOR_WHITE;
            bColor = Graphics.COLOR_TRANSPARENT;
        } else {
            fColor = Graphics.COLOR_BLACK;
            bColor = Graphics.COLOR_TRANSPARENT;
        }
    }

    private function dowToString(arg) {
        if (Time.Gregorian.DAY_SUNDAY == arg) {
            return "Sun";
        } else if (Time.Gregorian.DAY_MONDAY == arg) {
            return "Mon";
        } else if (Time.Gregorian.DAY_TUESDAY == arg) {
            return "Tue";
        } else if (Time.Gregorian.DAY_WEDNESDAY == arg) {
            return "Wed";
        } else if (Time.Gregorian.DAY_THURSDAY == arg) {
            return "Thu";
        } else if (Time.Gregorian.DAY_FRIDAY == arg) {
            return "Fri";
        } else {
            return "Sat";
        }
    }

    private function monthToString(arg) {
        if (1 == arg) {
            return "Jan";
        } else if (2 == arg) {
            return "Feb";
        } else if (3 == arg) {
            return "Mar";
        } else if (4 == arg) {
            return "Apr";
        } else if (5 == arg) {
            return "May";
        } else if (6 == arg) {
            return "Jun";
        } else if (7 == arg) {
            return "Jul";
        } else if (8 == arg) {
            return "Aug";
        } else if (9 == arg) {
            return "Sep";
        } else if (10 == arg) {
            return "Oct";
        } else if (11 == arg) {
            return "Nov";
        } else {
            return "Dec";
        }
    }

}
