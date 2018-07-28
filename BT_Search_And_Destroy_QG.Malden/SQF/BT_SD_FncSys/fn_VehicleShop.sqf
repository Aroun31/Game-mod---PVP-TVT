#include "..\..\DA3F_macros.hpp"
	/*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_VehicleShop.sqf
    *
	*/

	disableSerialization;
		if !(createDialog "BTSD_VehicleShop") exitWith {};
			private _displayName 	= "";
			private _idx 			= -1;
			private _listVeh 		= Cfg_MissionInfo(getArray, str(side player), "vehicles");

			{
				_x params["_className", "_Condition", ["_prix", 0, [0]]];
				if (_Condition isEqualTo "") then {
					_Condition = "TRUE";
				};
				_Condition = DA3F_Compil(_Condition);
				if (_Condition) then {
					_displayName = Cfg_A3(getText,"cfgVehicles",_className,"displayName");

				_idx 	= 	ListVehicle lbAdd format ["%1 %2.Rsc", _displayName, _prix];
							ListVehicle lbSetData [_idx, _className];
							ListVehicle lbSetValue [_idx, _prix];
				};
			} forEach _listVeh;
			_ctrlTxtHead = (ctrlParent ListVehicle) displayCtrl 1000;
			[_ctrlTxtHead]call BT_fnc_GetRessource;
