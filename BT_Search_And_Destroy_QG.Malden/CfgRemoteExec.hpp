#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        F(BT_fnc_SelectCamps,ANYONE)
        F(BT_fnc_execCodeTarget,ANYONE)
        F(BT_fnc_SelectCampsByServer,SERVER)
        F(BIS_fnc_endMission,ANYONE)

    };

    class Commands {
        mode = 1;
        jip = 0;

        F(hint,ANYONE)
        F(hintSilent,ANYONE)
        F(addAction,ANYONE)
        F(systemChat,ANYONE)
        F(addHandgunItem,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addWeapon,ANYONE)
        F(setFuel,ANYONE)
    };
};
