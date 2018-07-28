class default
{
    idd         = -1;
    duration    = 0;
    fadein      = 0;
    fadeout     = 0;
};

class DA3F_BarProg
{
	idd 		= 180707;
	name 		= "DA3F_BarProg";
	Author 		= "@roun";
   	duration 	= 300;
   	fadein 		= 0;
   	fadeout 	= 5;
   	onload		= "uinamespace setvariable [""DA3F_BarProg"",param [0, displayNull, [displayNull]]]";

	class controlsBackground 	{};

	class controls {

        class ProgressBar : DA3F_Progress
        {
            idc         = 1800;
            colorBar[]  = {1,0.3,0.1,0.95};
            x = 0.225938 * safezoneW + safezoneX;
            y = 0.358 * safezoneH + safezoneY;
            w = 0.150937 * safezoneW;
            h = 0.015 * safezoneH;
            colorFrame[]={1,0.8,0.1,0.75};
        };

        class DA3F_TxtInfoProgress: DA3F_StructuredText
        {
            idc = 1100;
            text = "progression"; //--- ToDo: Localize;
            x = 0.225938 * safezoneW + safezoneX;
            y = 0.386 * safezoneH + safezoneY;
            w = 0.150937 * safezoneW;
            h = 0.042 * safezoneH;
            colorBackground[]={0,0,0,0.45};
        };
	};
};

class DA3F_Combat
    {
        idd = 1000020;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  3;
        fadein       =  0.1;
        fadeout      =  2;
        name = "DA3F_Combat";
        onLoad = "uinamespace setvariable [""DA3F_Combat"",param [0,[[displayNull],[displayNull]]]]";
    class controls
        {
            class structuredText
            {
                access = 0;
                type = 13;
                idc = 1100;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX+safeZoneW-0.0185;
                y = safeZoneY+safeZoneH-0.958;
                w = 0.095 * safezoneW;
                h = 0.0580106 * safezoneH;
                size = 0.035;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,0,0,1};
                text = "";
                font = "PuristaSemiBold";
                    class Attributes
                {
                        font = "PuristaSemiBold";
                        color = "#DE0101";
                        align = "Left";
                        valign = "top";
                        shadow = 5;
                        shadowColor = "#FEF600";
                        underline = false;
                        size = "2.5";
                };
            };
        };
    };
