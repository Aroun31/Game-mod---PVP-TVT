class BTSD_CaptureAction
{
	idd 	= 2407182;
	name	= "BTSD_CaptureAction";
	author	= "@roun";
	enableSimulation = true;

	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.644 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};

		class DA3F_BackGLine : DA3F_Frame
		{
			idc = 1001;
			text = "Action de capture"; //--- ToDo: Localize;
			x = 0.648331 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.271666 * safezoneW;
			h = 0.676741 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			sizeEx = 0.045;
		};
			
	};

	class controls
	{
		class CloseBtn: DA3F_Btn_Close
		{
			idc = 2400;
			text = "X | fermer"; //--- ToDo: Localize;
			x = 0.650936 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.269062 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DA3F_Btn_01: DA3F_Btn
		{
			idc = 2401;
			text = ""; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
			//onbuttonclick = "0=[] spawn BT_fnc_SpawnBotsInCity";
		};

		class DA3F_Btn_02: DA3F_Btn
		{
			show = false;

			idc = 2402;
			text = "Action 02"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_03: DA3F_Btn
		{
			show = false;

			idc = 2403;
			text = "Action 03"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_04: DA3F_Btn
		{
			show = false;

			idc = 2404;
			text = "Action 04"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_05: DA3F_Btn
		{
			show = false;

			idc = 2405;
			text = "Action 05"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_06: DA3F_Btn
		{
			show = false;

			idc = 2406;
			text = "Action 06"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_07: DA3F_Btn
		{
			show = false;

			idc = 2407;
			text = "Action 07"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_08: DA3F_Btn
		{
			show = false;

			idc = 2408;
			text = "Action 08"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};
		class DA3F_Btn_09: DA3F_Btn
		{
			show = false;

			idc = 2409;
			text = "Action 09"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.766 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
		};

	};
};
