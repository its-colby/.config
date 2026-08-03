        // Hold = RCtrl; tap = enter Russian (F16 + tog L_RU)
        ru_on: ru_layer_on {
            compatible = "zmk,behavior-hold-tap";
            label = "RU_ON";
            #binding-cells = <1>;
            flavor = "tap-preferred";
            tapping-term-ms = <200>;
            bindings = <&kp>, <&m_ru_on>;
        };
        // Hold = RCtrl; tap = leave Russian (F17 + to DEFAULT)
        ru_off: ru_layer_off {
            compatible = "zmk,behavior-hold-tap";
            label = "RU_OFF";
            #binding-cells = <1>;
            flavor = "tap-preferred";
            tapping-term-ms = <200>;
            bindings = <&kp>, <&m_ru_off>;
        };
