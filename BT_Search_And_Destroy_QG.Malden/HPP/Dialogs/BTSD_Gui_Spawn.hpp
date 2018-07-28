class BTSD_Spawn
{
	idd 	= 160718;
	name 	= "BTSD_Spawn";
	author	= "@roun";

	class controlsBackground
	{
		class DA3F_BackGB: DA3F_BackG
		{
			idc = 1000;
			x = 0.093125 * safezoneW + safezoneX;
			y = 0.108 * safezoneH + safezoneY;
			w = 0.885937 * safezoneW;
			h = 0.728 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class BTSD_PixBackG: DA3F_Pix
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,0.5)";
			x = 0.0996875 * safezoneW + safezoneX;
			y = 0.122 * safezoneH + safezoneY;
			w = 0.872812 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class BTSD_TextSpawn_header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#FEFEFE' size='3' align='center' >Spawn<t/>"; //--- ToDo: Localize;
			x = 0.119375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.833437 * safezoneW;
			h = 0.084 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class BTSD_PixDesc: DA3F_Pix
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.486875 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.448 * safezoneH;
		};
	};

	class controls
	{
		class BTSD_Btn_Model: DA3F_btn
		{
			onButtonClick = "_this call BT_fnc_Spawn_Valide";
			x = 0.125938 * safezoneW + safezoneX;
			y = 0;
			w = 0.34125 * safezoneW;
			h = 0.07 * safezoneH;
			show = false;
			colorBackground[] = {0,0.2,0.8,0.2};
		};

		class BTSD_Btn_SpBase: BTSD_Btn_Model
		{
			idc = 2400;
			text = "Base"; //--- ToDo: Localize;
			//x = 0.125938 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			//w = 0.34125 * safezoneW;
			//h = 0.07 * safezoneH;
			show = true;
		};

		class BTSD_Btn_SpTeam: BTSD_Btn_Model
		{
			idc = 2401;
			text = "Team"; //--- ToDo: Localize;
			//x = 0.125938 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			//w = 0.34125 * safezoneW;
			//h = 0.07 * safezoneH;
			show = true;
		};

		class BTSD_Btn_BackLobby: BTSD_Btn_Model
		{
			idc = 2402;
			text = "Lobby"; //--- ToDo: Localize;
			//x = 0.125938 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			//w = 0.34125 * safezoneW;
			//h = 0.07 * safezoneH;
			show = true;
		};
	};
};