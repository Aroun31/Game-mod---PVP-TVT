
	class BTSD_Cfg_Mission
	{

		class RandProps
		{
			
			// Spawn Menu
			BT_Img_BackGSp 	= ""; // Image de fond du spawn menu
			BT_Img_DescSp 	= ""; // Image de description du spawn menu

			// Other
			BT_MaxVehTeam	= 10;
			JailMarker		= "BTSD_Mrk_Jail"; // Marker de prison
			AmmoAssom[]		= {"30Rnd_9x21_Yellow_Mag"}; // Muns Assommante "B_9x21_Ball_Tracer_Yellow"

		};

		class Defense
		{
			Mrk_Bases	= "BTSD_Mrk_Base_Defense";
			Weapons[]	= {"hgun_P07_F", "arifle_Katiba_GL_F", "arifle_SPAR_02_blk_F", "LMG_Zafir_F", "srifle_GM6_F", "launch_RPG32_F"};
			Optics[]	= {"optic_Holosight", "optic_AMS", "optic_Arco", "optic_ERCO_blk_F", "optic_Hamr", "optic_DMS", "optic_KHS_blk", "optic_LRPS"};

		};

		class Assaillant
		{
			Mrk_Bases	= "BTSD_Mrk_Base_Assaillant";
			Weapons[]	= {"hgun_Rook40_F", "arifle_MX_F", "arifle_MX_SW_Black_F", "MMG_02_sand_F", "srifle_LRR_camo_F"};
			Optics[]	= {"optic_Holosight", "optic_AMS", "optic_Arco", "optic_ERCO_blk_F", "optic_Hamr", "optic_DMS", "optic_KHS_blk", "optic_LRPS"};				
		};
	};