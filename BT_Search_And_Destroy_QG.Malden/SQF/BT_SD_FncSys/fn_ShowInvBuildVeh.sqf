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
    *           fn_ShowInvBuildVeh.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		if (dialog) then {
			closeDialog 0;
		};

		private _BTSD_vehQG = cursorObject;

			if (isNull _BTSD_vehQG) exitWith {};
			if (_BTSD_vehQG distance player > 9) exitWith {};
			if !(_BTSD_vehQG isKindOf "Car") exitWith {};

			_BTSD_SideQG = _BTSD_vehQG getVariable "BTSD_SideQG";

			if (isNil "_BTSD_SideQG") exitWith {};

				if !(_BTSD_SideQG isEqualTo (side player)) exitWith {};

					if !(createDialog "BTSD_BuildVeh") exitWith {};
						private _LineBackG 		= My_Ctrl(240718,1000);
						private _list_InvVeh 	= My_Ctrl(240718,1500);
						private _list_Near 		= My_Ctrl(240718,1501);
						private _list_Items		= Cfg_MissionInfo(getArray,str(side player),"Items_Build");

				    {

						_x params["_className", "_Condition", ["_prix", 0, [0]]];
						if (_Condition isEqualTo "") then {
							_Condition = "TRUE";
						};

						_Condition = DA3F_Compil(_Condition);
						if (_Condition) then {
							_displayName = Cfg_A3(getText,"cfgVehicles",_className,"displayName");
						        _BTSD_index = _list_InvVeh lbAdd format["%1 %2.Rsc",_displayName,_prix];
						        _list_InvVeh lbSetData [_BTSD_index, _className];
						        _list_InvVeh lbSetValue [_BTSD_index, _prix];
						    };

				    } forEach _list_Items;

				    [_LineBackG]call BT_fnc_GetRessource;