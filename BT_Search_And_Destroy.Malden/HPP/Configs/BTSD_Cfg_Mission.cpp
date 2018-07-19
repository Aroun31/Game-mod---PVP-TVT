
	class BTSD_Cfg_Mission
	{

		class RandProps
		{
			
			// Spawn Menu
			BT_Img_BackGSp 	= ""; // Image de fond du spawn menu
			BT_Img_DescSp 	= ""; // Image de description du spawn menu

			// Other
			BT_MaxVehTeam	= 10;
			MyCondi[]		= {"if (alive player) then {true}","player distance _obj < 15 && {alive player && {isTouchingGround player}}"};

		};

		class Map_infos
		{
			JailMarker		= "BTSD_Mrk_Jail"; // Marker de prison
			// Rôles et markers
			Markers_Bases[]	= {
				{"Defense", "BTSD_Mrk_Base_Defense"},
				{"Assaillant", "BTSD_Mrk_Base_Assaillant"}
			};
		};

		class BTSD_Cfg_Stuff
		{
			AmmoAssom[]		= {"30Rnd_9x21_Yellow_Mag"}; // "B_9x21_Ball_Tracer_Yellow"
			
			class Defense
			{
				Weapons[]	= {"hgun_P07_F", "arifle_MX_F", "arifle_MX_SW_Black_F", "MMG_02_sand_F", "srifle_LRR_camo_F", "launch_RPG32_F"};
				Optics[]	= {"optic_Holosight", "optic_AMS", "optic_Arco", "optic_ERCO_blk_F", "optic_Hamr", "optic_DMS", "optic_KHS_blk", "optic_LRPS"};
				Vehicles[]	= {};
			};

			class Assaillant
			{
				Weapons[]	= {"hgun_Rook40_F", "arifle_Katiba_GL_F", "arifle_SPAR_02_blk_F", "LMG_Zafir_F", "srifle_GM6_F", "srifle_DMR_01_F"};
				Optics[]	= {"optic_Holosight", "optic_AMS", "optic_Arco", "optic_ERCO_blk_F", "optic_Hamr", "optic_DMS", "optic_KHS_blk", "optic_LRPS"};
				Vehicles[]	= {};
			};
		};
	};