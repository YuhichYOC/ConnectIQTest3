class OnUpdatePrinter {

    private var partialAllowed;

    private var awake;

    private var dialLayer;

    private var basicPalette = [
        Graphics.COLOR_BLACK,
        Graphics.COLOR_WHITE,
    ];

    private var dip;

    private var hmp;

    private var dSize;

    private var dateLayer;

    private var dap;

    private var dPos;

    //private var iSize;

    private var iSizeL1;

    private var iSizeL2;

    private var iSizeL3;

    //private var iconLayer;

    private var iconLayerL1;

    private var iconLayerL2;

    private var iconLayerL3;

    //private var ip;

    private var ipl1;

    private var ipl2;

    private var ipl3;

    //private var iPos;

    private var iPosL1;

    private var iPosL2;

    private var iPosL3;

    private var sp;

    public function AllowPartial(arg) {
        partialAllowed = arg;
    }

    public function Awaken(arg) {
        awake = arg;
    }

    public function init(argDc) {
        dPos = [ 0, argDc.getHeight() * 3 / 5 ];
        //iPos = [ argDc.getWidth() * 1 / 12, argDc.getHeight() / 7 ];
        iPosL1 = [ argDc.getWidth() * 1 / 4, argDc.getHeight() / 7 ];
        iPosL2 = [ argDc.getWidth() * 1 / 4, (argDc.getHeight() / 7) + 21 ];
        iPosL3 = [ argDc.getWidth() * 1 / 4, (argDc.getHeight() / 7) + 42 ];
        tryAlloc(argDc);
        initPrinter();
    }

    private function tryAlloc(argDc) {
        dialLayer = new BBLayer();
        dialLayer.tryAllocWithPalette(argDc, basicPalette);
        dSize = [ argDc.getWidth(), Graphics.getFontHeight(Graphics.FONT_SMALL) ];
        dateLayer = new BBLayer();
        dateLayer.tryAllocWithSize(argDc, dSize);
        //iSize = [ argDc.getWidth() * 5 / 6, 20 * 2 + 1 ];
        //iconLayer = new BBLayer();
        //iconLayer.tryAllocWithSize(argDc, iSize);
        iSizeL1 = [ argDc.getWidth() / 2, 20 ];
        iSizeL2 = [ argDc.getWidth() / 2, 20 ];
        iSizeL3 = [ argDc.getWidth() / 2, 20 ];
        iconLayerL1 = new BBLayer();
        iconLayerL1.tryAllocWithSize(argDc, iSizeL1);
        iconLayerL2 = new BBLayer();
        iconLayerL2.tryAllocWithSize(argDc, iSizeL2);
        iconLayerL3 = new BBLayer();
        iconLayerL3.tryAllocWithSize(argDc, iSizeL3);
    }

    private function initPrinter() {
        dip = new DialPrinter();
        hmp = new HMHandsPrinter();
        dap = new DatePrinter();
        //ip = new IconPrinter();
        ipl1 = new IconPrinterL1();
        ipl2 = new IconPrinterL2();
        ipl3 = new IconPrinterL3();
        sp = new SHandPrinter();
        if (dialLayer.success()) {
            sp.init(dialLayer.size(), dialLayer.center());
        }
    }

    public function run(dc) {
        dc.clearClip();
        dip.print(dialLayer);
        hmp.init(System.getClockTime());
        hmp.print(dialLayer);
        if (dialLayer.success()) {
            dc.drawBitmap(0, 0, dialLayer.buffer());
        }
        runDatePrinter(dc);
        runIconPrinter(dc);
        if (partialAllowed) {
            sp.printWithClip(dc, System.getClockTime());
        } else if (awake) {
            sp.print(dc, System.getClockTime());
        }
    }

    private function runDatePrinter(dc) {
        if (dateLayer.success()) {
            var c = dateLayer.context();
            c.drawBitmap(-(dPos[0]), -(dPos[1]), dialLayer.buffer());
            dap.print(dateLayer);
            dc.drawBitmap(dPos[0], dPos[1], dateLayer.buffer());
        }
    }

    private function runIconPrinter(dc) {
        //if (iconLayer.success()) {
        //    var c = iconLayer.context();
        //    c.drawBitmap(-(iPos[0]), -(iPos[1]), dialLayer.buffer());
        //    ip.init(iSize[0], 20);
        //    ip.print(iconLayer);
        //    dc.drawBitmap(iPos[0], iPos[1], iconLayer.buffer());
        //}
        var c = null;
        if (iconLayerL1.success()) {
            c = iconLayerL1.context();
            c.drawBitmap(-(iPosL1[0]), -(iPosL1[1]), dialLayer.buffer());
            ipl1.init(iSizeL1[0], 20);
            ipl1.print(iconLayerL1);
            dc.drawBitmap(iPosL1[0], iPosL1[1], iconLayerL1.buffer());
        }
        if (iconLayerL2.success()) {
            c = iconLayerL2.context();
            c.drawBitmap(-(iPosL2[0]), -(iPosL2[1]), dialLayer.buffer());
            ipl2.init(iSizeL2[0], 20);
            ipl2.print(iconLayerL2);
            dc.drawBitmap(iPosL2[0], iPosL2[1], iconLayerL2.buffer());
        }
        if (iconLayerL3.success()) {
            c = iconLayerL3.context();
            c.drawBitmap(-(iPosL3[0]), -(iPosL3[1]), dialLayer.buffer());
            ipl3.init(iSizeL3[0], 20);
            ipl3.print(iconLayerL3);
            dc.drawBitmap(iPosL3[0], iPosL3[1], iconLayerL3.buffer());
        }
    }

    public function runPartial(dc) {
        if (partialAllowed) {
            if (dialLayer.success()) {
                dc.drawBitmap(0, 0, dialLayer.buffer());
            }
            if (dateLayer.success()) {
                dc.drawBitmap(dPos[0], dPos[1], dateLayer.buffer());
            }
            //if (iconLayer.success()) {
            //    dc.drawBitmap(iPos[0], iPos[1], iconLayer.buffer());
            //}
            if (iconLayerL1.success()) {
                dc.drawBitmap(iPosL1[0], iPosL1[1], iconLayerL1.buffer());
            }
            if (iconLayerL2.success()) {
                dc.drawBitmap(iPosL2[0], iPosL2[1], iconLayerL2.buffer());
            }
            if (iconLayerL3.success()) {
                dc.drawBitmap(iPosL3[0], iPosL3[1], iconLayerL3.buffer());
            }
            sp.printWithClip(dc, System.getClockTime());
        }
    }

}
