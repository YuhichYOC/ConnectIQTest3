class IconPrinter {

    private var battIcon10;

    private var battIcon20;

    private var battIcon50;

    private var bluetoothIcon;

    private var doNotDisturbIcon;

    private var nightModeIcon;

    private var notify1Icon;

    private var notify2Icon;

    private var notify3IconPlus;

    private var printBattIcon;

    private var printBluetoothIcon;

    private var printDoNotDisturbIcon;

    private var printNightModeIcon;

    private var printNotifyIcon;

    private var pos;

    private var iconsCount;

    public function initIp() {
        if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
            battIcon10 = WatchUi.loadResource(Rez.Drawables.BattIcon10W);
            battIcon20 = WatchUi.loadResource(Rez.Drawables.BattIcon20W);
            battIcon50 = WatchUi.loadResource(Rez.Drawables.BattIcon50W);
            bluetoothIcon = WatchUi.loadResource(Rez.Drawables.BluetoothIconW);
            doNotDisturbIcon = WatchUi.loadResource(Rez.Drawables.DoNotDisturbIconW);
            nightModeIcon = WatchUi.loadResource(Rez.Drawables.NightModeIconW);
            notify1Icon = WatchUi.loadResource(Rez.Drawables.Notify1IconW);
            notify2Icon = WatchUi.loadResource(Rez.Drawables.Notify2IconW);
            notify3IconPlus = WatchUi.loadResource(Rez.Drawables.Notify3PlusIconW);
        } else {
            battIcon10 = WatchUi.loadResource(Rez.Drawables.BattIcon10B);
            battIcon20 = WatchUi.loadResource(Rez.Drawables.BattIcon20B);
            battIcon50 = WatchUi.loadResource(Rez.Drawables.BattIcon50B);
            bluetoothIcon = WatchUi.loadResource(Rez.Drawables.BluetoothIconB);
            doNotDisturbIcon = WatchUi.loadResource(Rez.Drawables.DoNotDisturbIconB);
            nightModeIcon = WatchUi.loadResource(Rez.Drawables.NightModeIconB);
            notify1Icon = WatchUi.loadResource(Rez.Drawables.Notify1IconB);
            notify2Icon = WatchUi.loadResource(Rez.Drawables.Notify2IconB);
            notify3IconPlus = WatchUi.loadResource(Rez.Drawables.Notify3PlusIconB);
        }
        printBattIcon = false;
        printBluetoothIcon = false;
        printDoNotDisturbIcon = false;
        printNightModeIcon = false;
        printNotifyIcon = false;
    }

    public function printIcons(l) {
        iconsCount = 0;
        if (51 > System.getSystemStats().battery) {
            printBattIcon = true;
            ++iconsCount;
        }
        if (System.getDeviceSettings().phoneConnected) {
            printBluetoothIcon = true;
            ++iconsCount;
        }
        if (System.getDeviceSettings().doNotDisturb) {
            printDoNotDisturbIcon = true;
            ++iconsCount;
        }
        if (0 < System.getDeviceSettings().notificationCount) {
            printNotifyIcon = true;
            ++iconsCount;
        }
        var current = System.getClockTime().hour * 3600 + System.getClockTime().min * 60 + System.getClockTime().sec;
        if (Toybox.UserProfile.getProfile().sleepTime.value() < current || current < Toybox.UserProfile.getProfile().wakeTime.value()) {
            printNightModeIcon = true;
            ++iconsCount;
        }
        if (l.success()) {
            fillPositions(l);
            var c = l.context();
            putBattIcon(c);
            putBluetoothIcon(c);
            putDoNotDisturbIcon(c);
            putNightModeIcon(c);
            putNotifyIcon(c);
        }
    }

    private function fillPositions(l) {
        var totalWidth = 32 * iconsCount;
        var posX = l.center()[0];
        var posY = l.center()[1];
        pos = [
            [ 0, 0, false ],
            [ 0, 0, false ],
            [ 0, 0, false ],
            [ 0, 0, false ],
            [ 0, 0, false ]
        ];
        if (4 < iconsCount) {
            pos[4][0] = posX - (totalWidth / 2) + (32 * 4);
            pos[4][1] = (posY * 2.0) / 5;
        }
        if (3 < iconsCount) {
            pos[3][0] = posX - (totalWidth / 2) + (32 * 3);
            pos[3][1] = (posY * 2.0) / 5;
        }
        if (2 < iconsCount) {
            pos[2][0] = posX - (totalWidth / 2) + (32 * 2);
            pos[2][1] = (posY * 2.0) / 5;
        }
        if (1 < iconsCount) {
            pos[1][0] = posX - (totalWidth / 2) + 32;
            pos[1][1] = (posY * 2.0) / 5;
        }
        pos[0][0] = posX - (totalWidth / 2);
        pos[0][1] = (posY * 2.0) / 5;
    }

    private function putBattIcon(c) {
        if (printBattIcon) {
            if (51 > System.getSystemStats().battery) {
                var p = mostLeftPos();
                p[2] = true;
                if (11 > System.getSystemStats().battery) {
                    c.drawBitmap(p[0], p[1], battIcon10);
                } else if (21 > System.getSystemStats().battery) {
                    c.drawBitmap(p[0], p[1], battIcon20);
                } else if (51 > System.getSystemStats().battery) {
                    c.drawBitmap(p[0], p[1], battIcon50);
                }
            }
        }
    }

    private function putBluetoothIcon(c) {
        if (printBluetoothIcon) {
            var p = mostLeftPos();
            c.drawBitmap(p[0], p[1], bluetoothIcon);
            p[2] = true;
        }
    }

    private function putDoNotDisturbIcon(c) {
        if (printDoNotDisturbIcon) {
            var p = mostLeftPos();
            c.drawBitmap(p[0], p[1], doNotDisturbIcon);
            p[2] = true;
        }
    }

    private function putNightModeIcon(c) {
        if (printNightModeIcon) {
            var p = mostLeftPos();
            c.drawBitmap(p[0], p[1], nightModeIcon);
            p[2] = true;
        }
    }

    private function putNotifyIcon(c) {
        if (printNotifyIcon) {
            if (0 < System.getDeviceSettings().notificationCount) {
                var p = mostLeftPos();
                p[2] = true;
                if (2 < System.getDeviceSettings().notificationCount) {
                    c.drawBitmap(p[0], p[1], notify3IconPlus);
                } else if (1 < System.getDeviceSettings().notificationCount) {
                    c.drawBitmap(p[0], p[1], notify2Icon);
                } else if (0 < System.getDeviceSettings().notificationCount) {
                    c.drawBitmap(p[0], p[1], notify1Icon);
                }
            }
        }
    }

    private function mostLeftPos() {
        for (var i = 0; i < 4; ++i) {
            if (!pos[i][2]) {
                return pos[i];
            }
        }
        return null;
    }

}
