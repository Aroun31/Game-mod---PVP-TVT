    /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F-BT] Aroun Le BriCodeur
    *
    *       File :
    *           onPlayerRespawn.sqf
    *
    */
    player addAction ["Je veux mon vehicle",BT_fnc_Buy_Vehicles];
    player addAction ["HELLO LOBBY",{failMission "BackLobby"}];
    waitUntil {!(isNil "BTSD_NextOk")};
    waitUntil {BTSD_NextOk};
    [] call BT_fnc_Spawn_menu;