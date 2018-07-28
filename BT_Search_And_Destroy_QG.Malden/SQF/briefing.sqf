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
    *           briefing.sqf
    *			[]execVM "SQF\briefing.sqf";
    *
	*/

waitUntil {!isNull player && player isEqualTo player};
if(player diarySubjectExists "rules")exitwith{};

//player createDiarySubject ["Opfor","Unités Opfor sur la map"];
player createDiarySubject ["TeamSpeak","TeamSpeak 3"];
player createDiarySubject ["GameMod","Game Mod infos"];
player createDiarySubject ["Clavier","Clavier Racc."];
player createDiarySubject ["Crédits","Historique"];
// <img image='wellDone_ca.paa' />
/*
	player createDiaryRecord ["Opfor",
		[
			"Nombre d'ennemis sur la map",
				"
					<execute expression='call DA3F_fnc_countUnitOpenMap'>Compter les unités Opfor</execute>
				"
		]
	];
*/
	player createDiaryRecord ["Clavier",
		[
			"Raccourcis des touches",
				"
					<br/>
					<br/>
					Volume ""-"" 				= 	(7 è `);
					<br/>
					Volume ""+""				= 	(8 _ \);
					<br/>
					Menu Tanslate (traduction)	= 	windows left (gauche)
					<br/>
					Menu QG Deployed (Déployé) 	= 	windows left (gauche) face to QG (face au QG)
					<br/>
				"
		]
	];


	player createDiaryRecord ["GameMod",
		[
			"Participer au projet",
				"
					<br/>
					Tu peux toi aussi participer donc n'hésite pas à proposer ton travail pour améliorer / évoluer la mission.
					<br/>
					<br/>
					Il ne s'agit pas d'être un grand dev', si tu sais configurer des shops ou faire des textures ou éditer une map, ou si tu es un bêta-testeur chinois,
					<br/>
					<br/>
					Tu peux poser ta pierre à l'édifice à ton tour.
					<br/>
					<br/>
					N'hésite pas à poser des questions si besoin sur notre TS.
					<br/>
					<br/>
					<br/>
					Si la création de mod de jeu ou de mission te plais vraiment, que tu as un minimum de base et que tu es motivé,
					<br/>
					<br/>
					je peux t'aider dans la réalisation de projet que tu souhaites proposer.
					<br/>
					<br/>
					Je précise quand même...
					<br/>
					<br/>
					ME PARLE PAS DE ALTIS LIFE !!!!
					<br/>
					<br/>
					voilà ;)
					<br/>
				"
		]
	];

	player createDiaryRecord ["GameMod",
		[
			"Les ressources",
				"
					<br/>
						En cas de capture d'une zone ou de la mort d'un ennemi,
					<br/>
						des ressources sont ajoutés à votre équipe.
					<br/>
					<br/>
						La sortie de véhicules et la mise en place de gardes dans vos villes,
					<br/>
					vous coûtera des ressources qui seront débités de votre équipe.
					<br/>
				"
		]
	];

	player createDiaryRecord ["GameMod",
		[
			"Conditions de victoire",
				"
					<br/>
					L'ensemble de la carte doit être capturé par votre équipe
					<br/>
					<br/>
					OU
					<br/>
					<br/>
					Trouvez le QG mobile de l'ennemi et détruisez-le.
					<br/>
				"
		]
	];


	player createDiaryRecord ["TeamSpeak",
		[
			"Notre TeamSpeak 3",
				"
					<br/>
					ts3.devarma3france.fr:12517
					<br/><br/>
					Merci d'y être présent le bon déroulement des communications.
					<br/><br/>
					Demandez Aroun ou le staff [DA3F]
					<br/>
					pour toutes questions ou suggestions sur le serveur.
					<br/>
					Le teamspeak est aussi disponible sur la map <marker name='DA3F_BriCodeurTeam_TS'>TeamSpeak</marker>
				"
		]
	];


	player createDiaryRecord ["Crédits",
		[
			"Pourquoi cette mission",
				"
					<br/>
					Le ""CTI"" (Capture the Island)...
					<br/>
					<br/>
					Mod de jeu oublié des joueurs de Arma 3 et pourtant c'est un mod qui a brillé sur Arma 2
					<br/>
					Ayant connu cette ambiance que la mécanique de jeu fait connaître aux joueurs,
					<br/>
					j'avais envie de retrouver ce que j'ai connu à l'époque et donc de remettre en avant la ""CTI"" sur Arma 3.
					<br/>
					<br/>
					J'ai donc développé cette mission pour faire partager la version que j'en ai connu.
					<br/>
					Effectivement comme beaucoup de mode de jeu différente version ont existés.
					<br/>
					<br/>
					La 1ère version ""CTI"" que je vous propose est une capture de la map via différent drapeux (1 par zone de capture) et la défense du QG mobile de votre équipe.
					<br/>
					<br/>
					QG Mobile = véhicule devant être protégé et devant être déployé pour utiliser les fonctionnalitées disponible sur celui-ci.
					<br/>
					<br/>
					Je rappel que je me suis inspiré de la mécanque de jeu mais en aucun cas je n'ai pris un ""CTI"" que j'ai édité.
					<br/>
					Tout est scripté par mes soins, c'est pourquoi je vous demande d'être indulgent et de signaler les bugs ou contradictions que vous pourriez rencontrer lors des 1ere game afin d'obtenir un mod de jeu le plus clean possible.
					<br/>
					Bien entendu tout est testé avant d'être mis sur le serveur mais il m'est parfois difficile de faire les tests en multi avec plusieurs personnes simultanément, mais je suis attentif aux demandes et observations reçu.
					<br/>
					Merci à tous et ... Bon jeu, soyez fair-play,
					<br/>
					nous sommes tous ici pour passer du bon temps !
				"
		]
	];
	player createDiaryRecord ["Crédits",

		[
			"Remerciement",
				"
					<br/>
					Merci à toute les personnes qui témoignent du soutient en vers le projet ou la DA3F en général
					<br/>
					Un grand MERCI aux contributeurs de la mission grâce à vous le projet évolue.
					<br/>
					Liste des contributeurs à venir...
				"
		]
	];