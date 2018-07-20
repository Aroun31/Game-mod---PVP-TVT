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
    *           init_SidePlayer.sqf
    *
    */



    // For all

        BTSD_Vip        = FALSE;
        BTSD_NrbKill    = 0;
        BTSD_NextOk     = FALSE;
        DA3F_IsAction   = FALSE;

        player setVariable ["BTSD_Jail", FALSE, TRUE];
        player setVariable ["BTSD_Coma", 0, FALSE];

    // by side
    switch (side player) do {
        case west: {
            /* STATEMENT */
        };

        case east: {
            /* STATEMENT */
        };
    };


        BTSD_NextOk     = TRUE;