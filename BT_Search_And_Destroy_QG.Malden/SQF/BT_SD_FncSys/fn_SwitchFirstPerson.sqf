	/*
    *
    *       Project :
    *              Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SwitchFirstPerson.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/


	DA3F_CombatTime = time;

		if (DA3F_FirstViewActiv) exitWith	{};
			DA3F_FirstViewActiv = true;

			[DA3F_FirstViewActiv]call BT_fnc_switchTitleModCombat;

			while {(DA3F_CombatTime > (time - 60))} do
			{
				if ((cameraView isEqualTo "EXTERNAL") && ((vehicle player) isEqualTo player)) then {
					player switchCamera "INTERNAL";
					[DA3F_FirstViewActiv]call BT_fnc_switchTitleModCombat;
				};
				sleep 0.01;
			};

			DA3F_FirstViewActiv = false;
			[DA3F_FirstViewActiv]call BT_fnc_switchTitleModCombat;
