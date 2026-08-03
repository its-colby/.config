        // Stress mark still via Unicode Hex (rare; single codepoint).
        UC(m_ru_stress, N0, N3, N0, N1); // ́ combining acute

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
