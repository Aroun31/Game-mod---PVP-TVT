#include "..\..\DA3F_macros.hpp"
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
    *           fn_UnitRespawn.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		params ["_unit", "_corpse"];

			//private _BT_stuff = []call BT_fnc_GetStuff;

			private _BTSD_Mrk_Hosto = Cfg_MissionInfo(getText,"RandProps","HospitalMarker");
			private _BT_stuff = getUnitLoadout _corpse;
			_unit setUnitLoadout _BT_stuff;
			//_unit setPosWorld (getPosWorld _corpse);
			_unit setPosWorld (getMarkerPos _BTSD_Mrk_Hosto);
			deleteVehicle _corpse;

        disableSerialization;
        sleep 0.05;
        private _display = (findDisplay 160718);
        if !(isNull _display) then {
            _display closeDisplay 0;
        };

            "" cutText ["Sortie du bloc opératoire","BLACK FADED", 1.5];
            sleep (4 + random 3);

            "" cutText ["<t color='#FEFEFE' size='1.5' align='center' >Vous voilà à l'hôpital militaire<br/>Faites appel à votre équipe pour repartir.<t/><br/><br/><t color='#FF0000' size='3' align='center' >Zone de cessé le feu<br/>!! TIR INTERDIT !!<br/><t/>", "BLACK IN", 15, TRUE, TRUE];

		sleep 1;

          if (!(currentWeapon player isEqualTo "")) then {
              DA3F_WeaponPlayer = currentWeapon player;
              player action ["SwitchWeapon", player, player, 100];
              player switchCamera cameraView;
          };

        sleep 15;
        "" cutText ["", "PLAIN", 0];

        	//_unit setUnconscious true;
			/*
			_unit spawn {
				sleep 10;
				_this setUnconscious false;
			};
*/