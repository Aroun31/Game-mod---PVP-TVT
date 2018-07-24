
	class BTSD_Cfg_Mission
	{

		class RandProps
		{
			
			// Spawn Menu
			BT_Img_BackGSp 	= ""; // Image de fond du spawn menu
			BT_Img_DescSp 	= ""; // Image de description du spawn menu

			// Other
			BT_CaptureRess	= (100 + (round(random 1000)));
			BT_RessByKill	= (100 + (round(random 500))); // Ressource par kill (PVP not PVE)
			RessourceSpRenf	= 2000; // Coût en ressources pour le spawn de garde dans une ville
			BT_MaxVehTeam	= 10;	// Max vehicules par équipe
			BT_TimeRespawn	= 10; 	// Temps de respawn
			HospitalMarker	= "BTSD_Mrk_Hosto"; // Marker de prison
			JailMarker		= "BTSD_Mrk_Jail"; // Marker de prison
			AmmoAssom[]		= {"30Rnd_9x21_Yellow_Mag"}; // Muns Assommante "B_9x21_Ball_Tracer_Yellow"

			TimeCapture		= 0.45; // Temps de capture d'un drapeau
			
			AllFlags[]		= {
				"BTSD_Flag_01",
				"BTSD_Flag_02",
				"BTSD_Flag_03",
				"BTSD_Flag_04",
				"BTSD_Flag_05",
				"BTSD_Flag_06",
				"BTSD_Flag_07",
				"BTSD_Flag_08",
				"BTSD_Flag_09",
				"BTSD_Flag_10",
				"BTSD_Flag_11",
				"BTSD_Flag_12"
			}; 
		};
// Ne pas s'en occuper pour la version QG
/*
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
*/

// ["className",[pos modeltoworld],dir]
		class west
		{
			Name_Var_Qg		= "BT_Veh_QG_West"; // Sud de l'île
			PosStartQg[]	= {{1052.75,682.681,0},{8211.73,5557.07,0},{8505.86,10468.3,0}}; 
			BTSD_ObjBase[] 	= {
				{"Land_RepairDepot_01_green_F", {7, -6, 0}, 45}
			};
			// {"ClassName", "Condition", ressource}
			vehicles[]		= {
				{"B_Truck_01_fuel_F", "", 300},
				{"B_Truck_01_medical_F", "", 350},
				{"B_MRAP_01_F", "", 250},
				{"B_MRAP_01_hmg_F", "", 350},
				{"B_LSV_01_armed_F", "", 350},
				{"B_LSV_01_unarmed_F", "", 250},
				{"B_Quadbike_01_F", "", 200}
			};

			Items_Build[] = {
			// {"ClassName", "Condition", ressource}
				{"Land_SandbagBarricade_01_hole_F", "", 100},
				{"Land_SandbagBarricade_01_F", "", 100},
				{"Land_SandbagBarricade_01_half_F", "", 100},
				{"CamoNet_INDP_big_F", "", 100},
				{"Land_Cargo_Patrol_V2_F", "", 100},
			};

		};

		class east
		{
			Name_Var_Qg		= "BT_Veh_QG_East"; // Nord de l'île
			PosStartQg[]	= {{7027.9,12177.3,0},{5002.75,10358.9,0},{6835.72,2744.79,0}};
			BTSD_ObjBase[] 	= {
				{"Land_RepairDepot_01_tan_F", {7, -6, 0}, 45}
			};
			// {"ClassName", "Condition"}
			vehicles[]		= {
				{"O_MRAP_02_F", "", 300},
				{"O_MRAP_02_hmg_F", "", 350},
				{"O_LSV_02_unarmed_F", "", 250},
				{"O_LSV_02_armed_F", "", 350},
				{"O_Truck_03_medical_F", "", 350},
				{"O_Truck_03_fuel_F", "", 250},
				{"O_Quadbike_01_F", "", 200}
			};
			
			Items_Build[] = {
			// {"ClassName", "Condition", ressource}
				{"Land_SandbagBarricade_01_hole_F", "", 100},
				{"Land_SandbagBarricade_01_F", "", 100},
				{"Land_SandbagBarricade_01_half_F", "", 100},
				{"CamoNet_INDP_big_F", "", 100},
				{"Land_Cargo_Patrol_V2_F", "", 100},
			};
		};
	};