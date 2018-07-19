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

    //player addAction ["HELLO LOBBY",{failMission "BackLobby"}];



    waitUntil {!(isNil "BTSD_NextOk")};
    waitUntil {BTSD_NextOk};
    [] call BT_fnc_Spawn_menu;

    if !((backpack player) isEqualTo "") then {removeBackpack player;};

    player addBackpack "B_Kitbag_mcamo";
    clearBackpackCargoGlobal player;
    (unitBackpack player) setObjectTextureGlobal [0,""];