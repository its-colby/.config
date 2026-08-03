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
