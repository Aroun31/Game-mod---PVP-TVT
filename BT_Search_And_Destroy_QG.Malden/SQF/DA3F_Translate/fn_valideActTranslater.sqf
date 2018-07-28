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
    *           fn_valideActTranslater.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;

		private _BTSD_Ctrl 		= param[0, controlNull, [controlNull]];
		private _BTSD_Display 	= ctrlParent _BTSD_Ctrl;
		private _BTSD_CtrlTxt	= _BTSD_Display displayCtrl 1100;
		private _BTSD_TxtCtrl	= ctrlText _BTSD_CtrlTxt;
		private _BTSD_ShowText 	= "";
		private _BTSD_txt		= "";
		private _BTSD_translate = "";

				_BTSD_IDC 		= ctrlIDC _BTSD_Ctrl;

		 switch (str(_BTSD_IDC)) do {

		    case "1500": {
		     	_BTSD_idx		= lbCurSel _BTSD_Ctrl;
		     	_BTSD_data 		= _BTSD_Ctrl lbData _BTSD_idx;
		     	_BTSD_ShowText 	= format ["%1 %2 ", _BTSD_TxtCtrl, GetXML(_BTSD_data), " "];
		     	DA3F_RecTranslateConv pushBack _BTSD_data;
		      	_BTSD_CtrlTxt ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1' align='center' >%1<t/>", _BTSD_ShowText];
		      	[_BTSD_CtrlTxt]call BT_fnc_HeightText;
		    };

		    // Clear message
		    case "2400": {
		     	_BTSD_CtrlTxt ctrlSetStructuredText parseText "";
		     	DA3F_RecTranslateConv = [];
		    };

		    // Envoi target conv
		    case "2401": {

		    	{
		    		_BTSD_translate = GetXML(_x);
		    		_BTSD_txt = _BTSD_txt + format ["%1%2", " ", _BTSD_translate];
		    	} forEach DA3F_RecTranslateConv;

		    	[DA3F_RecTranslateConv] remoteExecCall ["BT_fnc_msgTranslateRecu",DA3F_DestiTranslate];
		    	hint format ["Vous avez envoyé :\n\n%1\n-----------\n\nLe message lui sera traduit à la réception", _BTSD_txt];

		    	DA3F_DestiTranslate 	= objNull;
		    	DA3F_RecTranslateConv 	= [];

		    	closeDialog 0;
		    };
		 };