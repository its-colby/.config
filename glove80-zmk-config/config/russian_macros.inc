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
        // Hold B, tap A — toggle Russian (F18 + tog L_RU; same HS toggle as Mac)
        m_ru_tog: macro_ru_tog {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp F18 &tog L_RU>;
        };
        // Mouse / game HUDs — same F-key pattern as Vestnik (HS listens)
        // Shift+F18 = mouse toggle; Shift+F16 = game toggle (bare F16/F18 = Russian)
        m_mouse_tog: macro_mouse_tog {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp LS(F18) &tog L_MOUSE>;
        };
        m_game_tog: macro_game_tog {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_tap &kp LS(F16) &tog L_GAME>;
        };
        m_lclk_down: macro_lclk_down {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_press &mkp LCLK>;
        };
        m_lclk_up: macro_lclk_up {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&macro_release &mkp LCLK>;
        };
