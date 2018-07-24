class BTSD_BuildVeh
{
	idd 	= 240718;
	name	= "BTSD_BuildVeh";
	author	= "@roun";
	
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1001;
			x = 0.276874 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.532 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class DA3F_BackLine: DA3F_Frame
		{
			idc = 1000;
			text = "Build shop";
			x = 0.270313 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.459375 * safezoneW;
			h = 0.56 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.045;
		};
		class DA3F_TextListCoffre : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='0.4'>&#160;</t><br/><t color='#FEFEFE' size='1' align='center' >Inventaire du QG<t/>"; //--- ToDo: Localize;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class DA3F_TextListNear : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t size='0.4'>&#160;</t><br/><t color='#FEFEFE' size='1' align='center' >Objets autour du QG<t/>"; //--- ToDo: Localize;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.056 * safezoneH;
			show = false;
		};
		class CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.266 * safezoneH;
			class Controls
			{
				class DA3F_Textinfo : DA3F_StructuredText
				{
					idc = 1102;
					x = 0.00656303 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.1575 * safezoneW;
					h = 0.238 * safezoneH;
				};
			};
		};
	};

	class controls
	{
		class List_Inv: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.196 * safezoneH;
			OnLbSelchanged	= "_this call BT_fnc_InfosObj";
		};

		class List_Near: DA3F_RscListBox
		{
			idc = 1501;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.196 * safezoneH;
			OnLbSelchanged	= "_this call BT_fnc_InfosObj";
			show = false;
		};
		class BtnValideExitObj: DA3F_Btn
		{
			idc = 2400;
			text = "Acheter l'objet"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.056 * safezoneH;
			OnButtonClick = "_this call BT_fnc_ValideActInvBuild";
		};
		class BtnValideEnterObj: DA3F_Btn
		{
			idc = 2401;
			text = "Mettre dans le coffre"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.056 * safezoneH;
			OnButtonClick = "_this call BT_fnc_ValideActInvBuild";
			show = false;
		};
		class CloseBtn: DA3F_Btn_Close
		{
			idc = 2402;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.056 * safezoneH;
		};

	};
};
