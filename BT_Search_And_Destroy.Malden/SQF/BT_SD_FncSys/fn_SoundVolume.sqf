#include "..\..\DA3F_macros.hpp"
    /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F-BT] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SoundVolume.sqf
    *
    */

    private _BTSD_type          = param[0];
    private _BTSD_soundActual   = soundVolume;
    private _BTSD_timeEffect    = 0.5;
    private _BTSD_msg           = "";
    private _BTSD_value         = "";
    private _BTSD_validefnc     = FALSE;

        switch (_BTSD_type) do {

                case TRUE: {

                    if (_BTSD_soundActual >= 1) exitWith {
                        _BTSD_soundActual = 0;
                    };

                   _BTSD_soundActual = _BTSD_soundActual + 0.1;

                };

                case FALSE: {

                    if (_BTSD_soundActual <= 0) exitWith {
                        _BTSD_soundActual = 1;
                    };

                   _BTSD_soundActual = _BTSD_soundActual - 0.1;

                };
            };

            private _translateValue = {
                private _value      = param[0, 0, [0]];
                private _StrValue   = str _value;
                private _arr        = _StrValue splitString "";
                private _NewValue   = "";
                switch (true) do {

                    case (count _arr isEqualTo 1): {
                        _NewValue   = format ["%1", _arr # 0];
                    };

                    case (count _arr isEqualTo 3): {
                        _NewValue   = format ["0.%1", _arr # 2];
                    };

                    case (count _arr > 3): {
                        _NewValue   = format ["0.%1", _arr # 2];
                    };

                };

                    systemChat _NewValue;
                    _NewValue = DA3F_Compil(_NewValue);

                    _NewValue
            };

            _BTSD_value     = [_BTSD_soundActual]call _translateValue;
            _BTSD_timeEffect fadeSound _BTSD_value;
            _BTSD_validefnc = true;
            _BTSD_msg       = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>", (soundVolume * 100), "%"];

        [_BTSD_msg, 0.65, 0.85, 3, 0.5] spawn BIS_fnc_dynamicText;
      _BTSD_validefnc