class GUI_Translate
{
	idd 	= 260718;
	name	= "GUI_Translate";
	author	= "@roun";

	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.014375 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.85};
		};
		
		class DA3F_Line: DA3F_Frame
		{
			idc = 1001;
			text = $STR_DA3F_SysTranslate;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.322 * safezoneH;
			sizeEx = 0.045;
			moving = true;
			colorBackground[] = {-1,-1,-1,0.5};
			color[] = {1, 0.2, 0, 0.75};
		};

		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.230938 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.252 * safezoneH;
			class Controls
			{
				class Txt_Phrase: DA3F_StructuredText
				{
					idc = 1100;
					x = 0.00656199 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.224 * safezoneH;
				};
			};
		};		
	};

	class controls
	{
		class List_Txt: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.0209375 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.252 * safezoneH;
			OnLbDblClick = "_this call BT_fnc_valideActTranslater;";
		};

		class Btn_Clear: DA3F_Btn
		{
			idc = 2400;
			text = "Clear message";
			x = 0.394999 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "_this call BT_fnc_valideActTranslater;";
		};

		class Btn_Send: DA3F_Btn
		{
			idc = 2401;
			text = "Send";
			x = 0.394999 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "_this call BT_fnc_valideActTranslater;";
		};

		class Btn_Close: DA3F_Btn_Close
		{
			idc = 2402;
			x = 0.394999 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};
