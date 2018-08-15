class OnUpdatePrinter {

    private var l;

    private var dp;

    private var hmp;

    private var sp;

    public function init(argDc) {
        l = new BBLayer();
        l.tryAlloc(argDc);
        dp = new DialPrinter();
        hmp = new HMHandsPrinter();
        sp = new SHandPrinter();
        if (l.success()) {
            sp.tellSize(l.size());
            sp.tellCenter(l.center());
        }
    }

    public function run(dc) {
        System.println("OnUpdatePrinter::run");
        if (l.success()) {
            var clockTime = System.getClockTime();
            System.println(Lang.format("OnUpdatePrinter::run $1$:$2$:$3$", [ clockTime.hour, clockTime.min, clockTime.sec ]));
            dp.printDial(l);
            hmp.init(clockTime);
            hmp.printHMHands(l);
            dc.drawBitmap(0, 0, l.buffer());
            sp.printSHand(dc, clockTime);
        }
    }

    public function runPartial(dc) {
        System.println("OnUpdatePrinter::runPartial");
        if (l.success()) {
            var clockTime = System.getClockTime();
            System.println(Lang.format("OnUpdatePrinter::runPartial $1$:$2$:$3$", [ clockTime.hour, clockTime.min, clockTime.sec ]));
            dc.drawBitmap(0, 0, l.buffer());
            sp.printSHand(dc, clockTime);
        }
    }

}
