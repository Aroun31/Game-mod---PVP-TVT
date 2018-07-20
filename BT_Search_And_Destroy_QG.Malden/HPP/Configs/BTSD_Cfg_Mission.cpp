
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
// ["className",[pos modeltoworld],dir]
		class west
		{
			Name_Var_Qg		= "BT_Veh_QG_West"; // Sud de l'île
			PosStartQg[]	= {1052.75,682.681,0}; 
			BTSD_ObjBase[] 	= {
				{"Land_RepairDepot_01_green_F", {7, -6, 0}, 45}
			};
			// {"ClassName", "Condition"}
			vehicles[]		= {
				{"B_Truck_01_fuel_F", ""},
				{"B_Truck_01_medical_F", ""},
				{"B_MRAP_01_F", ""},
				{"B_MRAP_01_hmg_F", ""},
				{"B_LSV_01_armed_F", ""},
				{"B_LSV_01_unarmed_F", ""},
				{"B_Quadbike_01_F", ""}
			};
		};

		class east
		{
			Name_Var_Qg		= "BT_Veh_QG_East"; // Nord de l'île
			PosStartQg[]	= {7027.9,12177.3,0};
			BTSD_ObjBase[] 	= {
				{"Land_RepairDepot_01_tan_F", {7, -6, 0}, 45}
			};
			// {"ClassName", "Condition"}
			vehicles[]		= {
				{"O_MRAP_02_F", ""},
				{"O_MRAP_02_hmg_F", ""},
				{"O_LSV_02_unarmed_F", ""},
				{"O_LSV_02_armed_F", ""},
				{"O_Truck_03_medical_F", ""},
				{"O_Truck_03_fuel_F", ""},
				{"O_Quadbike_01_F", ""}
			};
		};
	};