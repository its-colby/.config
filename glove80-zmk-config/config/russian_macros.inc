        // Stress: F14 → Hammerspoon applies ́ to the character before the cursor
        m_ru_stress: macro_ru_stress {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp F14>;
        };

        // Russian layer enter/leave: signal Hammerspoon (F16/F17) then change layer.
        // Letters are plain &kp; Vestnik Cyrillic is applied in ~/.config/hammerspoon/vestnik.lua
        m_ru_on: macro_ru_on {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp F16 &tog L_RU>;
        };
        m_ru_off: macro_ru_off {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp F17 &to DEFAULT>;
        };
