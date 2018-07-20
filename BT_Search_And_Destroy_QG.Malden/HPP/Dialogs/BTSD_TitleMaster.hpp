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
   	duration 	= 15;
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