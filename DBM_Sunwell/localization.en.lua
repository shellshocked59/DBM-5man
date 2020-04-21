DBM_SW_TAB						= "SunwellTab"
DBM_SUNWELL						= "Sunwell Plateau"

-- Kalecgos
DBM_KAL_NAME					= "Kalecgos"
DBM_KAL_DESCRIPTION 			= "Announces and shows timers for Frost Breath, Wild Magic and Curse of Boundless Agony."

DBM_KAL_KILL_NAME				= "Sathrovarr the Corruptor"
DBM_KAL_DEMON_SHORT				= "Sathravarr"

DBM_KAL_OPTION_BREATH			= "Announce Frost Breath"
DBM_KAL_OPTION_PREBREATH		= "Show \"Frost Breath soon\" warning"
DBM_KAL_OPTION_WM_WARN			= "Announce Wild Magic"
DBM_KAL_OPTION_WM_WHISPER		= "Send whisper to Wild Magic targets"
DBM_KAL_OPTION_COA_WARN			= "Announce Curse of Boundless Agony"
DBM_KAL_OPTION_COA_ICON			= "Set icon on Curse of Boundless Agony target"
DBM_KAL_OPTION_PORT_PREWARN		= "Show \"Portal soon\" warning"
DBM_KAL_OPTION_PORT_WARN		= "Announce Portals"
DBM_KAL_OPTION_WM_WARN2			= "Show Wild Magic debuff type"
DBM_KAL_OPTION_SHOWFRAME		= "Show Spectral Realm frame"
DBM_KAL_FRAME_UPWARDS			= "Expand Spectral Realm frame upwards"
DBM_KAL_FRAME_UPWARDS2			= "Expand upwards"
DBM_KAL_FRAME_COLORS			= "Use class colors"
DBM_KAL_OPTION_RANGE			= "Show range check frame"
DBM_KAL_OPTION_STRIKE			= "Announce Corrupting Strike"
DBM_KAL_OPTION_FRAME			= "Show health frame"

DBM_KAL_SPELLID_BREATH			= 44799
DBM_KAL_SPELLIDS_WM				= { -- DO NOT TRANSLATE (should be moved to kalecgos.lua!)
	[44978] = "Heal",	-- Healing done by spells and effects increased by 100%.
	[45001] = "Cast",	-- Casting time increased by 100%.
	[45002] = "Hit",	-- Chance to hit with melee and ranged attacks reduced by 50%.
	[45004] = "Crit",	-- Damage done by critical hits increased by 100%.
	[45006] = "Aggro",	-- Increases threat generated by 100%.
	[45010] = "Cost"	-- Spell and ability costs reduced by 50%.
}
DBM_KAL_SPELLID_COA1			= 45032
DBM_KAL_SPELLID_COA2			= 45034
DBM_KAL_SPELLID_PORT1			= 46021
DBM_KAL_SPELLID_BLAST			= 44866
DBM_KAL_SPELLID_BUFFET			= 45018
DBM_KAL_YELL_PULL				= "Aggh!! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!"

DBM_KAL_WARN_BREATH				= "Frost Breath"
DBM_KAL_WARN_BREATH_SOON		= "Frost Breath soon"
DBM_KAL_WHISPER_WM				= "Wild Magic: %s"
DBM_KAL_WARN_COA				= "Curse of Boundless Agony: >%s<"
DBM_KAL_WARN_PORT				= "Portal #%d: >%s< (Group %d)"
DBM_KAL_WARN_PORT_SOON			= "Portal #%d soon"
DBM_KAL_WARN_STRIKE				= "Corrupting Strike on >%s<"

DBM_KAL_WARN_CASTTIME			= "+100% cast time"
DBM_KAL_WARN_HIT				= "-50% hit chance"
DBM_KAL_WARN_CRIT				= "+100% crit damage"
DBM_KAL_WARN_AGGRO				= "+100% threat"
DBM_KAL_WARN_COST				= "-50% spell costs"
DBM_KAL_WARN_HEAL				= "+100% heal"

DBM_KAL_FRAME_TITLE				= "Spectral Realm"
DBM_KAL_MENU_LOCK				= "Lock frame"
DBM_KAL_FRAME_HIDE				= "Hide frame"

DBM_KAL_HEALTHFRAME_TITLE		= "Dragon/Demon HP"

DBM_KAL_STATUS_MSG				= "Dragon: %d%% Demon: %d%%"

-- Brutallus
DBM_BRUTALLUS_NAME				= "Brutallus"
DBM_BRUTALLUS_DESCRIPTION		= "Announces and shows timers for Burn and Enrage."

DBM_BRUTALLUS_YELL_PULL			= "Ahh! More lambs to the slaughter!"

DBM_BRUTALLUS_OPTION_BURN		= "Announce Burn"
DBM_BRUTALLUS_OPTION_BURN2		= "Announce jumped Burn debuffs"
DBM_BRUTALLUS_OPTION_BAR_BURN2	= "Jumped Burn: <target>"
DBM_BRUTALLUS_OPTION_METEOR		= "Announce Meteor"
DBM_BRUTALLUS_OPTION_METEOR_ON_BURN	= "Warn when Meteor hits Burned target"
DBM_BRUTALLUS_OPTION_STOMP		= "Announce Stomp"
DBM_BRUTALLUS_OPTION_BURN3		= "Set icon on Burn target"
DBM_BRUTALLUS_OPTION_BURN4		= "Show special warning when you have Burn"
DBM_BRUTALLUS_OPTION_DEL_BURN	= "Show delayed Burn timer"
DBM_BRUTALLUS_OPTION_DEL_BURN2	= "Show delayed Burn announce"
DBM_BRUTALLUS_OPTION_PRESTOMP	= "Show 5 sec warning for Stomp"
DBM_BRUTALLUS_OPTION_TIMERSTOMP	= "Continue warning every second for Stomp"

DBM_BRUTALLUS_WARN_BURN			= "Burn: >%s<"
DBM_BRUTALLUS_WHISP_BURN		= "Burn on you!"
DBM_BRUTALLUS_WARN_STOMP		= "Stomp: >%s<"
DBM_BRUTALLUS_WARN_METEOR		= "Meteor"
DBM_BRUTALLUS_WARN_DEL_BURN		= "15 sec Burn on >%s<"
DBM_BRUTALLUS_WARN_STOMP_SOON	= "Stomp in 5 sec"


-- Felmyst
DBM_FELMYST_NAME				= "Felmyst"
DBM_FELMYST_DESCRIPTION			= "Announces Gas Nova, Deep Breath and Demonic Vapor."

DBM_FELMYST_OPTION_SPECGAS		= "Show special warning for Gas Nova"
DBM_FELMYST_OPTION_GASSOON		= "Show \"Gas Nova soon\" warning"
DBM_FELMYST_OPTION_BREATH_SOON	= "Show \"Deep Breath soon\" warning"
DBM_FELMYST_OPTION_VAPOR		= "Announce Demonic Vapor target"

DBM_FELMYST_EMOTE_BREATH		= "%s takes a deep breath."

DBM_FELMYST_WARN_GAS			= "Gas Nova"
DBM_FELMYST_WARN_GAS_SOON		= "Gas Nova soon"
DBM_FELMYST_WARN_ENCAPS			= "Encapsulate: >%s<"
DBM_FELMYST_WARN_AIR			= "Air Phase"
DBM_FELMYST_LAND_SOON			= "Ground Phase in 10 sec"
DBM_FELMYST_BREATH_SOON_FMT		= "Deep Breath #%d in 10 sec"
DBM_FELMYST_BREATH_SOON5_FMT	= "Deep Breath #%d in 5 sec"
DBM_FELMYST_BREATH_NOW_FMT		= "Deep Breath #%d"
DBM_FELMYST_ENCAPS_WARN_SAY		= "Encapsulate on me! Run away!"
DBM_FELMYST_WARN_VAPOR			= "Demonic Vapor: >%s<"


-- Eredar Twins
DBM_TWINS_NAME					= "Eredar Twins"
DBM_TWINS_DESCRIPTION			= "Announces and shows timers for Shadow Blades, Shadow Nova, Pyrogenics and Conflagration."
DBM_TWINS_OPTION_BLADES			= "Announce Shadow Blades"
DBM_TWINS_OPTION_BUFF			= "Announce Pyrogenics"
DBM_TWINS_OPTION_BLOW			= "Announce Confounding Blow"
DBM_TWINS_OPTION_BLOW_SOON		= "Show \"Confounding Blow soon\" warning"
DBM_TWINS_OPTION_CONFLAG		= "Conflagration: Announce"
DBM_TWINS_OPTION_CONFLAG2		= "Conflagration: Whisper"
DBM_TWINS_OPTION_CONFLAG3		= "Conflagration: Special Warning"
DBM_TWINS_OPTION_CONFLAG4		= "Conflagration: Icon"
DBM_TWINS_OPTION_CONFLAG5		= "Conflagration: Sound"
DBM_TWINS_OPTION_NOVA			= "Shadow Nova: Announce"
DBM_TWINS_OPTION_NOVA2			= "Shadow Nova: Whisper"
DBM_TWINS_OPTION_NOVA3			= "Shadow Nova: Special Warning"
DBM_TWINS_OPTION_NOVA4			= "Shadow Nova: Icon"
DBM_TWINS_OPTION_TOUCH1			= "Show special warning for Dark Touched debuffs"
DBM_TWINS_OPTION_TOUCH2			= "Show special warning for Fire Touched debuffs"

DBM_TWINS_MOB_WL				= "Grand Warlock Alythess"
DBM_TWINS_MOB_SOCR				= "Lady Sacrolash"
DBM_TWINS_EMOTE_CONFLAG			= "Alythess directs Conflagration at (.+)"
DBM_TWINS_EMOTE_NOVA			= "Sacrolash directs Shadow Nova at (.+)%."

DBM_TWINS_WARN_BLADES			= "Shadow Blades"
DBM_TWINS_WARN_NOVA_ON			= "Shadow Nova: >%s<"
DBM_TWINS_WARN_BUFF				= "Pyrogenics"
DBM_TWINS_WARN_CONFLAG_ON		= "Conflagration: >%s<"
DBM_TWINS_WARN_BLOW_SOON		= "Confounding Blow soon"
DBM_TWINS_WARN_BLOW				= "Confounding Blow"
DBM_TWINS_WHISPER_CONFLAG		= "Conflagration on you!"
DBM_TWINS_WHISPER_NOVA			= "Shadow Nova on you!"

DBM_TWINS_SPECWARN_SHADOW		= "Dark Touched: %d"
DBM_TWINS_SPECWARN_FIRE			= "Flame Touched: %d"


-- M'uru
DBM_MURU_NAME					= "M'uru"
DBM_MURU_DESCRIPTION			= "Announces Darkness, Fiends, Black Holes, Void Sentinels and humanoid spawns."
DBM_MURU_OPTION_VOID			= "Announce Void Sentinels"
DBM_MURU_OPTION_VOID_SOON		= "Show 5 sec warning for Void Sentinels"
DBM_MURU_OPTION_HUM				= "Announce Humanoids"
DBM_MURU_OPTION_HUM_SOON		= "Show 5 sec warning for Humanoids"
DBM_MURU_OPTION_DARKNESS		= "Announce Darkness and Fiends in phase 1"
DBM_MURU_OPTION_DARKNESS_SOON	= "Show \"Darkness/Fiends soon\" warning"
DBM_MURU_OPTION_HOLE_WARN		= "Announce Black Hole"
DBM_MURU_OPTION_HOLE_SOON_WARN	= "Show \"Black Hole soon\" warning"
DBM_MURU_OPTION_WARN_FIEND		= "Announce Fiends in phase 2"
DBM_MURU_OPTION_VOID_ZONE_WARN	= "Show special warning while in Void Zone"

DBM_MURU_ENTROPIUS				= "Entropius"

DBM_MURU_DARKNESS_SOON			= "Darkness and Fiends in 5 sec"
DBM_MURU_DARKNESS_INC			= "Darkness and Fiends"
DBM_MURU_WARN_VOID_SOON			= "Void Sentinel in 5 sec"
DBM_MURU_WARN_VOID_NOW			= "Void Sentinel spawned"
DBM_MURU_WARN_HUMANOIDS_SOON	= "Humanoids in 5 sec"
DBM_MURU_WARN_HUMANOIDS_NOW		= "Humanoids spawned"
DBM_MURU_WARN_FIEND				= "Dark Fiend spawned"
DBM_MURU_WARN_VOID_ZONE			= "Void Zone below!"
DBM_MURU_WARN_BLACKHOLE			= "Black Hole spawned"
DBM_MURU_WARN_BLACKHOLE_SOON	= "Black Hole soon"
DBM_MURU_WARN_P2				= "Phase 2"

-- Kil'jaeden
DBM_KIL_NAME					= "Kil'jaeden"
DBM_KIL_DESCRIPTION				= "Announces Orbs, Darkness, Shield, Reflections and Fire Bloom"

DBM_KIL_OPTION_RANGE			= "Show range check"
DBM_KIL_OPTION_SHIELD			= "Announce Shield of the Blue"
DBM_KIL_OPTION_ORB				= "Announce Orbs"
DBM_KIL_OPTION_FIRETARGET		= "Announce Fire Bloom targets"
DBM_KIL_OPTION_FIRESAY			= "Send chat message when you are afflicted by Fire Bloom"
DBM_KIL_OPTION_FIREWHISP		= "Send whisper to Fire Bloom targets"
DBM_KIL_OPTION_FIREICON			= "Set icons on Fire Bloom targets"
DBM_KIL_OPTION_SHOWFRAME		= "Show Fire Bloom target list"
DBM_KIL_OPTION_WARNREFL			= "Announce Sinister Reflections"
DBM_KIL_OPTION_DARTS			= "Announce Flame Darts"
DBM_KIL_OPTION_DRAGONORB		= "Announce Dragon Orbs"

DBM_KIL_YELL_PULL				= "The expendable have perished. So be it! Now I shall succeed where Sargeras could not! I will bleed this wretched world and secure my place as the true master of the Burning Legion! The end has come! Let the unravelling of this world commence!"
DBM_KIL_YELL_PHASE2_1			= "The enemy is among you!" -- this actually announces Sinister Reflections and not phase 2
DBM_KIL_YELL_PHASE2_2			= "Who can you trust?" -- wrong localization workaround

DBM_KIL_WARN_PHASE1				= "Phase 2"
DBM_KIL_WARN_PHASE2				= "Phase 3"
DBM_KIL_WARN_PHASE3				= "Phase 4 - Meteors"
DBM_KIL_WARN_PHASE4				= "Phase 5 - Enrage"
DBM_KIL_WARN_SHIELD				= "Shield of the Blue"
DBM_KIL_WARN_DARKNESS			= "Darkness"
DBM_KIL_WARN_DARKNESS_SOON		= "Darkness soon"
DBM_KIL_WARN_ORB				= "Orb spawned"
DBM_KIL_WARN_ORBS				= "Orbs spawned"
--DBM_KIL_WARN_FIRE				= "Fire Bloom incoming"
DBM_KIL_WARN_FIRE_ON			= "Fire Bloom: >%s<"
DBM_KIL_WARN_DARKNESS_NOW		= "Darkness of a Thousand Souls"
DBM_KIL_WARN_REFLECTIONS		= "Sinister Reflections"
DBM_KIL_WARN_FIRE_SAY			= "Fire Bloom on me!"
DBM_KIL_WARN_FIRE_WHISPER		= "Fire Bloom on you!"
DBM_KIL_WARN_DARTS_SOON			= "Flame Darts in 5 sec"
DBM_KIL_WARN_DARTS				= "Flame Darts"
DBM_KIL_WARN_DRAGORB_SOON		= "Dragon Orb in 5 sec"
DBM_KIL_WARN_DRAGORB_NOW		= "Dragon Orb spawned"


DBM_KIL_FRAME_TITLE				= "Fire Bloom"
DBM_KIL_MENU_LOCK				= DBM_KAL_MENU_LOCK
DBM_KIL_FRAME_COLORS			= DBM_KAL_FRAME_COLORS
DBM_KIL_FRAME_UPWARDS			= "Expand Fire Bloom target list upwards"
DBM_KIL_FRAME_UPWARDS2			= DBM_KAL_FRAME_UPWARDS2
DBM_KIL_FRAME_HIDE				= DBM_KAL_FRAME_HIDE

