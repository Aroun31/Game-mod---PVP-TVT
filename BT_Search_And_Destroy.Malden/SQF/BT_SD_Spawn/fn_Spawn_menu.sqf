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
    *           fn_Spawn_menu.sqf
    *
    */

    disableSerialization;
    if !(createDialog "BTSD_Spawn") exitWith {};

        private _BTSD_BackGroundPix = Cfg_MissionInfo(getText,"RandProps","BT_Img_BackGSp"); // Image de fond
        private _BTSD_PicturDesc    = ""; // Image description (la flemme ^^)
        private _BTSD_PixDesc       = My_Ctrl(160718,1200);
    	private _BTSD_PixBackG 		= My_Ctrl(160718,1201);
    	private _BTSD_Btn_Sp_Base 	= My_Ctrl(160718,2400);
    	private _BTSD_Btn_Sp_Team 	= My_Ctrl(160718,2401);
    	private _BTSD_Btn_Lobby 	= My_Ctrl(160718,2402);
        private _BTSD_ArmaLogo      = "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
        private _BTSD_ArmaPix       = "\A3\ui_f\data\GUI\Rsc\RscDisplayWelcome\welcome3_ca.paa";

        private _BTSD_BackGround    = if (_BTSD_BackGroundPix isEqualTo "") then [{
            _BTSD_ArmaLogo
            },{
            _BTSD_BackGroundPix
        }];

        private _BTSD_DescritionPix = if (_BTSD_PicturDesc isEqualTo "") then [{
            _BTSD_ArmaPix
            },{
            _BTSD_PicturDesc
        }];

        _BTSD_PixBackG ctrlSetText _BTSD_BackGround;
    	_BTSD_PixDesc ctrlSetText _BTSD_DescritionPix;

        // Base
        _BTSD_Btn_Sp_Base ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><img size='2' align='left' image='%1'/><t color='#FEFEFE' size='1.2' align='right' >%2<t/>",'\A3\ui_f\data\map\MapControl\taskIconDone_ca.paa', (ctrlText _BTSD_Btn_Sp_Base)];

        // Team
        _BTSD_Btn_Sp_Team ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><img size='2' align='left' image='%1'/><t color='#FEFEFE' size='2' align='right' >%2<t/>",'\A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_toolbox_groups_ca.paa', (ctrlText _BTSD_Btn_Sp_Team)];

        // Lobby
        _BTSD_Btn_Lobby ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><img size='2' align='left' image='%1'/><t color='#FEFEFE' size='2' align='right' >%2<t/>",'\A3\ui_f\data\GUI\Rsc\RscDisplayMain\exit_ca.paa', (ctrlText _BTSD_Btn_Lobby)];