local tbcCthun = DBM:NewBossMod("AQTBC", DBM_CTHUN_T65_NAME, DBM_AQ40_DESCRIPTION, DBM_ZONE_AQ40, "TBC5ManTab", 7)

tbcCthun.Version = "1.01"
tbcCthun.Author = "Jannik"
tbcCthun.MinRevision = 1000

local random = math.random

--------------------------------------------------------------------------------

--TODO - add options
tbcCthun:AddOption("WarnFankrissBreath", true, "DBM warning on Fankriss Breath (only recommended for tank)")
tbcCthun:AddOption("WarnFankrissTrap", true, "Warnings for Fankriss Trap")
tbcCthun:AddOption("WarnFankrissTrapWhisper", true, "Whisper warnings to others for Fanrkiss traps")
tbcCthun:AddOption("WarnFankrissTrapHitTimers", true, "Timers for when people get hit by Fankriss traps")
tbcCthun:AddOption("WarnPrincessTimers", true, "Princess timers - beta")
tbcCthun:AddOption("WarnPrincessPoison", true, "Warnings for Princess poison")
tbcCthun:AddOption("WarnPrincessReflect", true, "Warnings for Princess reflection")
tbcCthun:AddOption("WarnPrincessBerserk", true, "Warnings for Princess going berserk at 30%")
tbcCthun:AddOption("WarnCthunTimers", true, "Warnings for C'Thun timers")
tbcCthun:AddOption("WarnTornado", true, "Self  warning for being in a Tornado")






--------------------------------------------------------------------------------

tbcCthun:AddBarOption("Tentacles")
tbcCthun:AddBarOption("Dark Glare")
--TODO add all

--------------------------------------------------------------------------------

tbcCthun:RegisterEvents(
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_AURA_REFRESH",
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_DAMAGE",
	"SPELL_SUMMON",
	"SPELL_CREATE",
	"SWING_DAMAGE",
	"SWING_MISSED",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SENT"
)

tbcCthun:RegisterCombat("COMBAT", 5, DBM_CTHUN_T65_NAME);

--------------------------------------------------------------------------------

--
-- C'Thun
--
local function cThunPhaseStart(self)
	percent = "90%"

	--TODO remove this delay when combat start if figured out with a yell
	delay = 0
	if  self.CThunPhase == 1 then
		delay = 5
	end

	-- show distance
	-- is 10 yards for eye chaining, adding 1 for safetey
	DBM_Gui_DistanceFrame_SetDistance(11);
	DBM_Gui_DistanceFrame_Show()
	


	-- TODO count number of eye beams to tell when the next dark glare will be, repeat

	-- start initial tentacle & dark glare timer TODO scrap this approach and use above one
	self:StartStatusBarTimer((16 - delay), "Tentacles", "Interface\\Icons\\spell_shadow_siphonmana");
	self:StartStatusBarTimer((25 - delay), "Dark Glare", "Interface\\Icons\\spell_shadow_unholyfrenzy");

	

	if self.CThunPhase >= 2 then
		-- fankriss killed
		-- add small bug timer
		percent = "60%"
	end
	if self.CThunPhase >= 3 then
		-- princess killed
		-- add large bug timer
		percent = "30%"
	end
	if self.CThunPhase >= 4 then
		-- stomach killed
		-- unknown
		percent = "he dies"
	end


	self:Announce("C'Thun phase "..self.CThunPhase.." started until "..percent)
end

local function cThunPhaseEnd(self)
	-- clear all cthun timers
	DBM_Gui_DistanceFrame_Hide();
	self:EndStatusBarTimer("Tentacles")
	self:EndStatusBarTimer("Dark Glare")
	--TODO be sure to add all C'Thun timers
	--reset distance frame to default of 10, copied from gruuls.lua
	DBM_Gui_DistanceFrame_SetDistance(10);
end

--TODO should be set to be based off a yell, if one existed
function tbcCthun:OnCombatStart(delay)
	-- 0 if miniboss hasnt been encountered, 1 if active, 2 if dead
	self.Fankriss = 0
	self.Princess = 0
	self.Stomach = 0
	-- tracks phase 1-4 of cthun
	self.CThunPhase = 1
	-- 1 if cthun is active, else 0
	self.CThunActive = 1
	-- timestamp for cooldown on princess reflect
	self.LastPrincessReflect = 0

	cThunPhaseStart(self)
end
function tbcCthun:OnCombatEnd()
	-- clean up, set all variables to default
	self.Fankriss = 0
	self.Princess = 0
	self.Stomach = 0
	self.CThunPhase = 1
	self.CThunActive = 1
	self.LastPrincessReflect = 0
	DBM_Gui_DistanceFrame_Hide();
	DBM_Gui_DistanceFrame_SetDistance(10);
end

function tbcCthun:OnEvent(event, arg1, arg2, arg3, arg4, arg5)
	if event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 40735 then
			self:SendSync("WarnFankrissBreath")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoison"..arg1.destName)
		elseif arg1.spellId == 27564 then
			self:SendSync("PrincessReflectionStart")
		elseif arg1.spellId == 26068 then
			self:SendSync("PrincessBerserkStart")
		elseif arg1.spellId == 20367 then
			self:SendSync("CThunWarnPhaseEnding")
		end
	elseif event == "SPELL_AURA_REFRESH" then
		if arg1.spellId == 28431 then
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_AURA_REMOVED" then
		if arg1.spellId == 40735 then
			self:SendSync("WarnFankrissBreathEnd")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
		elseif arg1.spellId == 27564 then
			self:SendSync("PrincessReflectionEnd")
		end
	elseif event == "SPELL_CREATE" then
		if arg1.spellId == 25648 then
			player = arg1.sourceName
			self:SendSync("FankrissTrap"..player)
		end
	elseif event == "SPELL_CAST_START" then
		
	elseif event == "SPELL_DAMAGE" then
		if arg1.spellId == 26102 then
			player = arg1.destName
			self:SendSync("WarnFankrissBreathHit"..player)
		elseif arg1.spellId == 25656 then
			player = arg1.destName
			self:SendSync("WarnFankrissTrapHit"..player)
		elseif arg1.spellId == 25161 then
			self:SendSync("WindWarning")
		end
	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		elseif arg1.destName == DBM_CTHUN_T65_STOMACH_NAME then
			self:SendSync("StomachDown")
		end


	-- detecting miniboss pull, should work off yells instead
	elseif event == "SWING_DAMAGE" or event == "SWING_MISSED" then
		if self.Fankriss == 0 and arg1.sourceName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("Fankriss")
		elseif self.Princess == 0 and arg1.sourceName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("Princess")
		elseif self.Stomach == 0 and arg1.sourceName == DBM_CTHUN_T65_STOMACH_NAME then
			self:SendSync("Stomach")
		end
	end

end

function tbcCthun:OnSync(msg)

	--
	-- Fankriss
	--
	if msg == "Fankriss" then
		--set  fankriss to active, deactive cthun
		self.Fankriss = 1
		self.CThunActive = 0
		cThunPhaseEnd(self)

	elseif msg == "FankrissDown" then
		--set fankriss to dead, activate cthun phase 2
		self.Fankriss = 2
		self.CThunPhase = 2
		self.CThunActive = 1
		cThunPhaseStart(self)

		self:EndStatusBarTimer("Breath")
		self:EndStatusBarTimer("Sand Trap")

	elseif msg == "WarnFankrissBreath" then 
		self:EndStatusBarTimer("Next Breath")

		if self.Options.WarnFankrissBreath then
			self:AddSpecialWarning("Fankriss Breath Incoming!")
		end
		
	elseif msg == "WarnFankrissBreathEnd" then 

		self:EndStatusBarTimer("Incoming Breath")

	elseif msg:sub(1,21) == "WarnFankrissBreathHit" then 
		-- /rw that player got hit
		player = msg:sub(22)
		if self.Options.WarnFankrissBreath then
			self:Announce(player.." was hit by sand blast!")
		end
	elseif msg:sub(1,19) == "WarnFankrissTrapHit" then 
		-- /rw that player got hit
		player = msg:sub(20)

		self:Announce(player.." was hit by sand trap!")
		if self.Options.WarnFankrissTrapHitTimers then
			self:StartStatusBarTimer(15, "Sand Trap debuff on "..player, "Interface\\Icons\\inv_misc_dust_02")
		end
	elseif msg:sub(1,12) == "FankrissTrap" then
		player = msg:sub(13)

		if self.Options.WarnFankrissTrapWhisper then
			self:SendHiddenWhisper("Sand Trap on you!", player)
		end


		if self.Options.WarnFankrissTrap then
			if UnitName("player") == player then
				PlaySoundFile("Sound\\Spells\\PVPFlagTaken.wav"); 
				SendChatMessage("Sand Trap on me!", "SAY")
				self:AddSpecialWarning("Sand Trap!")
			end
		end

	--
	-- Princess
	--
	elseif msg == "Princess" then
		-- princess started, clear cthun
		self.Princess = 1
		self.CThunActive = 0
		cThunPhaseEnd(self)

		if self.Options.WarnPrincessTimers then
			self:ScheduleAnnounce(25, "Poison Barrage soon", 1);
			self:StartStatusBarTimer(30, "Next Poison Barrage", "Interface\\Icons\\spell_shadow_teleport")
			--self:StartStatusBarTimer(45, "Summon Guards", "Interface\\Icons\\spell_shadow_teleport")
		end
	elseif msg == "PrincessDown" then
		-- princess killed, start cthun
		self.Princess = 2
		self.CThunPhase = 3
		self.CThunActive = 1
		cThunPhaseStart(self)

		self:EndStatusBarTimer("Poison Rain")
		--self:EndStatusBarTimer("Summon Guards")

	elseif msg:sub(1,18) == "PrincessPoisonDrop" then
		player = msg:sub(19)
		-- clear timer from existing
		-- self:EndStatusBarTimer("Poisoned: "..player)
		if self.Options.WarnPrincessPoison then
			if UnitName("player") == player then
				SendChatMessage("Dropped poison", "SAY")
			end		
		end

	elseif msg:sub(1,14) == "PrincessPoison" then
		player = msg:sub(15)

		if self.Options.WarnPrincessPoison then
			--self:StartStatusBarTimer(9, "Poisoned: "..player, "Interface\\Icons\\spell_nature_corrosivebreath")

			if UnitName("player") == player then
				self:AddSpecialWarning("Poisoned!")
			end
		end

	
		
	elseif msg == "PrincessReflectionStart" then
		--this event fires multiple times as reflection buff gets applied&removed for some reason, so add a cooldown on it
		local now = GetTime()
		if now - self.LastPrincessReflect > 16 then
			self.LastPrincessReflect = now

			--start timer for 10 seconds of poison barrage and announce
			self:EndStatusBarTimer("Next Poison Barrage")
			if self.Options.WarnPrincessReflect then
				self:StartStatusBarTimer(10, "Poison Barrage", "Interface\\Icons\\spell_nature_nullifydisease")
				self:Announce("Poison Barrage!")
			end
		end
	elseif msg == "PrincessReflectionEnd" then
		--this event fires multiple times as reflection buff gets applied&removed for some reason, so use cooldown from PrincessReflectionStart but dont set new timestamp

		local now = GetTime()
		if now - self.LastPrincessReflect > 7 then
			--clear timers from poison, set timer for next reflection and shield bugs
			if self.Options.WarnPrincessTimers then
				self:EndStatusBarTimer("Poison Barrage")
				self:StartStatusBarTimer(50, "Next Poison Barrage", "Interface\\Icons\\spell_shadow_teleport")
				self:ScheduleAnnounce(45, "Poison Barrage soon", 1);
				--self:StartStatusBarTimer(5, "Shield Bugs Spawning", "Interface\\Icons\\inv_shield_05")
			end
		end
	elseif msg == "PrincessBerserkStart" then
		if self.Options.WarnPrincessBerserk then
			self:Announce("Princess Huhuran goes Berserk")
		end
	--
	-- Stomach
	--
	elseif msg == "Stomach" then
		self.Stomach = 1
		self.CThunActive = 0

	elseif msg == "StomachDown" then
		self.Stomach = 2
		self.CThunPhase = 4
		self.CThunActive = 1

	--
	-- C'Thun
	--
	elseif msg == "CThunWarnPhaseEnding" then
		self:Announce("C'Thun phase ending")

	--
	-- Tornados
	--
	elseif msg == "WindWarning" then
		if self.Options.WarnTornado then
			self:AddSpecialWarning("In Tornado")
		end

	end
end

