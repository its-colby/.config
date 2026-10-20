        // Hold-tap requires #binding-cells = <2> (ZMK const). Tap macros take 0 cells —
        // pass a dummy second arg (same pattern as &magic MAGIC 0).
        // Hold = RCtrl; tap = enter Russian (F16 + tog L_RU)
        ru_on: ru_layer_on {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <200>;
            bindings = <&kp>, <&m_ru_on>;
        };
        // Hold = RCtrl; tap = leave Russian (F17 + to DEFAULT)
        ru_off: ru_layer_off {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <200>;
            bindings = <&kp>, <&m_ru_off>;
        };
        // Tab thumb in Russian: tap = stress ́ , hold = Audio layer
        ru_tab: ru_stress_tab {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <200>;
            bindings = <&mo>, <&m_ru_stress>;
        };
        // RT3: hold = RGUI (Cmd); tap = toggle game (F13-hyper HUD + tog L_GAME)
        game_cmd: game_cmd_hold_tap {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "hold-preferred";
            tapping-term-ms = <200>;
            bindings = <&kp>, <&m_game_tog>;
        };
        // LT1/RT1: tap = Caps (same keycode that worked on old LT6); hold = Shift.
        // tap-preferred + 280ms — same as letter &lt; otherwise a normal tap is a Shift blip.
        shift_caps: shift_caps_hold_tap {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <280>;
            quick-tap-ms = <280>;
            bindings = <&kp>, <&kp>;
        };
        // Mouse layer S/H: tap = lock/unlock LCLK; hold = Primary apps / Browser.
        mouse_s: mouse_s_hold_tap {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <280>;
            quick-tap-ms = <280>;
            bindings = <&mo>, <&m_lclk_down>;
        };
        mouse_h: mouse_h_hold_tap {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            flavor = "tap-preferred";
            tapping-term-ms = <280>;
            quick-tap-ms = <280>;
            bindings = <&mo>, <&m_lclk_up>;
        };

