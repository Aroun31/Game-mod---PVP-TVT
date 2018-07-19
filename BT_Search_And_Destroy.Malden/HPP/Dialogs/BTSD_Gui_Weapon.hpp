class BTSD_Weapon_Shop
{
	idd 	= 180718;
	name	= "BTSD_Weapon_Shop";
	author	= "@roun";
	
	class controlsBackground
	{

		class DA3F_Line: DA3F_Frame
		{

			idc = 1001;
			text = "Fournitures"; //--- ToDo: Localize;
			x = 0.270313 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.459375 * safezoneW;
			h = 0.574 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			sizeEx	= 0.035;

		};

		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.504 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};

		class DA3F_TxtHead : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#F31400' size='1' align='center' >Armes<t/>"; //--- ToDo: Localize;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.42 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_TxtAmmo : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t color='#F31400' size='1' align='center' >Munitions<t/>"; //--- ToDo: Localize;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.42 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.126 * safezoneH;
			class Controls
			{
				class DA3F_TxtInfos : DA3F_StructuredText
				{
					idc = 1102;
					text = "<t color='#F31400' size='1' align='center' >infos<t/>"; //--- ToDo: Localize;
					x = 0.00656299 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.164062 * safezoneW;
					h = 0.098 * safezoneH;
				};
			};
		};
	};

	class controls
	{
		class DAF3_BtnExit: DA3F_Btn_Close
		{
			idc = 2401;
			text = "exit"; //--- ToDo: Localize;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "closeDialog 0";
			colorBackground[] = {1,-1,-1,0.75};
		};
	
		class DA3F_ListWp: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.224 * safezoneH;
			onLbSelchanged	= "[]call BT_fnc_ListeAmmo";
			onLBDblClick 	= "_this call BT_fnc_buyWeapon";
		};

		class DA3F_ListOptic: DA3F_RscListBox
		{
			idc = 1502;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.224 * safezoneH;
			onLbSelchanged	= "[]call BT_fnc_ListeAmmo";
			onLBDblClick 	= "_this call BT_fnc_buyWeapon";
		};

		class DA3F_ListAmmo: DA3F_RscListBox
		{
			idc = 1501;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.126 * safezoneH;
			onLBDblClick 	= "_this call BT_fnc_buyWeapon";
			/*
			onLBDblClick 	= "[]call BT_fnc_buyWeapon";
			onLbSelchanged 	= "[]call BT_fnc_";
			*/
		};

		class DA3F_BtnValide: DA3F_Btn
		{
			idc = 2400;
			text = "valide"; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.028 * safezoneH;
			show = false;
		};

	};
};
