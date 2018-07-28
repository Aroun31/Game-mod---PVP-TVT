#include "..\..\DA3F_macros.hpp"
	/*
    *
    *       Project :
    *              Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_runTranslate.sqf
    *
	*/

	disableSerialization;

			private _BTSD_Target = cursorObject;
			if (isNull _BTSD_Target) exitWith {hint "No Unit"};
			if (_BTSD_Target distance player > 8) exitWith {hint "No Unit"};
			if !(_BTSD_Target isKindOf "man") exitWith {hint "No Unit"};
			//if !(isPlayer _BTSD_Target) exitWith {hint "No playable Units\nthis a bot"};

			if !(isNull (findDisplay 260718)) exitWith {closeDialog 0};
			if !(createDialog "GUI_Translate") exitWith {};

				hint "Double clic sur un mot pour l'ajouter";

				private _BTSD_Display	= (findDisplay 260718);
				private _BTSD_txt		= "";
				private _BTSD_BackGLine	= My_Ctrl(260718, 1001);
				private _BTSD_TextLine	= ctrlText _BTSD_BackGLine;
				private _BTSD_ListBox	= My_Ctrl(260718, 1500);
				private _BTSD_idx		= -1;
				DA3F_DestiTranslate		= _BTSD_Target;
				private _BTSD_NewTxt	= format ["%1 avec/with %2", _BTSD_TextLine, name _BTSD_Target];
				_BTSD_BackGLine ctrlSetText _BTSD_NewTxt;

				private _BTSD_ArrayComs	= [
						"STR_DA3F_Hi",
						"STR_DA3F_Come",
						"STR_DA3F_GoingCapture",
						"STR_DA3F_GoingPatrol",
						"STR_DA3F_GoingSearchTeam",
						"STR_DA3F_GetWork",
						"STR_DA3F_GetFrom",
						"STR_DA3F_Yes",
						"STR_DA3F_No",
						"STR_DA3F_Thx",
						"STR_DA3F_GoStuff",
						"STR_DA3F_Arrive"
					];

					{

						_BTSD_txt = GetXML(_x);
						_BTSD_idx = _BTSD_ListBox lbAdd (format ["%1", _BTSD_txt]);
						_BTSD_ListBox lbSetData [_BTSD_idx, _x];

					} forEach _BTSD_ArrayComs;