class BTSD_VehicleShop
{
	idd 	= 200718;
	name 	= "BTSD_VehicleShop";
	author	= "@roun";

	class controlsBackground
	{
		class DAF3_BackGLine: DA3F_Frame
		{
			idc = 1000;
			text = "Vehicules"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.476 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = 0.04;
		};
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1001;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.42 * safezoneH;
			colorBackground[] = {-1,0.03,0.1,0.5};
		};
		
		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.364 * safezoneH;
			class Controls
			{
				class DA3F_TextInfo: DA3F_StructuredText
				{
					idc = 1100;
					text = "<t color='#FEFEFE' size='1' align='center' >Info<t/>"; //--- ToDo: Localize;
					x = 0.00656296 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.223125 * safezoneW;
					h = 0.336 * safezoneH;
				};
			};
		};
	};

	class controls
	{
		class ListVehicle : DA3F_RscListBox
		{
			onLbSelchanged 	= "";
			onLBDblClick 	= "_this call BT_fnc_Buy_Vehicles";
			idc = 1500;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.364 * safezoneH;
			sizeEx = 0.035;
		};
	};
};