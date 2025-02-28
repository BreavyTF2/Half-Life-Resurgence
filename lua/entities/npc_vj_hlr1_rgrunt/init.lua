AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl1/rgrunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.VJC_Data = {
    ThirdP_Offset = Vector(0, 0, -15), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"}
ENT.BloodColor = ""
ENT.HasBloodParticle = false
ENT.HasBloodDecal = false
ENT.Medic_CanBeHealed = false -- If set to false, this SNPC can't be healed!

ENT.BreathSoundLevel = 50
ENT.GeneralSoundPitch1 = 130
ENT.GeneralSoundPitch2 = 140
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_CustomOnInitialize()
	self:SetBodygroup(1, math.random(0, 1))
	self.SoundTbl_FootStep = {"vj_hlr/hl1_npc/rgrunt/pl_metal1.wav","vj_hlr/hl1_npc/rgrunt/pl_metal2.wav","vj_hlr/hl1_npc/rgrunt/pl_metal3.wav","vj_hlr/hl1_npc/rgrunt/pl_metal4.wav"}
	self.SoundTbl_Idle = {"vj_hlr/hl1_npc/rgrunt/rb_idle1.wav","vj_hlr/hl1_npc/rgrunt/rb_idle2.wav","vj_hlr/hl1_npc/rgrunt/rb_idle3.wav"}
	self.SoundTbl_Breath = {"vj_hlr/hl1_npc/rgrunt/rb_engine.wav"}
	self.SoundTbl_IdleDialogue = {"vj_hlr/hl1_npc/rgrunt/rb_question1.wav","vj_hlr/hl1_npc/rgrunt/rb_question2.wav","vj_hlr/hl1_npc/rgrunt/rb_question3.wav","vj_hlr/hl1_npc/rgrunt/rb_question4.wav","vj_hlr/hl1_npc/rgrunt/rb_question5.wav"}
	self.SoundTbl_IdleDialogueAnswer = {"vj_hlr/hl1_npc/rgrunt/rb_answer1.wav","vj_hlr/hl1_npc/rgrunt/rb_answer2.wav","vj_hlr/hl1_npc/rgrunt/rb_answer3.wav","vj_hlr/hl1_npc/rgrunt/rb_answer4.wav","vj_hlr/hl1_npc/rgrunt/rb_answer5.wav"}
	self.SoundTbl_CombatIdle = {"vj_hlr/hl1_npc/rgrunt/rb_combat1.wav","vj_hlr/hl1_npc/rgrunt/rb_combat2.wav","vj_hlr/hl1_npc/rgrunt/rb_combat3.wav","vj_hlr/hl1_npc/rgrunt/rb_combat4.wav","vj_hlr/hl1_npc/rgrunt/rb_taunt1.wav","vj_hlr/hl1_npc/rgrunt/rb_taunt2.wav","vj_hlr/hl1_npc/rgrunt/rb_taunt3.wav"}
	self.SoundTbl_Investigate = {"vj_hlr/hl1_npc/rgrunt/rb_investigate.wav"}
	self.SoundTbl_Alert = {"vj_hlr/hl1_npc/rgrunt/rb_alert1.wav","vj_hlr/hl1_npc/rgrunt/rb_alert2.wav","vj_hlr/hl1_npc/rgrunt/rb_alert3.wav","vj_hlr/hl1_npc/rgrunt/rb_alert4.wav","vj_hlr/hl1_npc/rgrunt/rb_alert5.wav"}
	self.SoundTbl_CallForHelp = {"vj_hlr/hl1_npc/rgrunt/rb_help.wav"}
	self.SoundTbl_WeaponReload = {"vj_hlr/hl1_npc/rgrunt/rb_cover1.wav","vj_hlr/hl1_npc/rgrunt/rb_cover2.wav"}
	self.SoundTbl_GrenadeAttack = {"vj_hlr/hl1_npc/rgrunt/rb_deploy1.wav","vj_hlr/hl1_npc/rgrunt/rb_deploy2.wav"}
	self.SoundTbl_OnGrenadeSight = {"vj_hlr/hl1_npc/rgrunt/rb_gren1.wav","vj_hlr/hl1_npc/rgrunt/rb_gren2.wav","vj_hlr/hl1_npc/rgrunt/rb_gren3.wav"}
	self.SoundTbl_OnDangerSight = {"vj_hlr/hl1_npc/rgrunt/rb_gren2.wav","vj_hlr/hl1_npc/rgrunt/rb_cover1.wav","vj_hlr/hl1_npc/rgrunt/rb_cover2.wav"}
	self.SoundTbl_OnKilledEnemy = {"vj_hlr/hl1_npc/rgrunt/rb_killed1.wav","vj_hlr/hl1_npc/rgrunt/rb_killed2.wav","vj_hlr/hl1_npc/rgrunt/rb_killed3.wav","vj_hlr/hl1_npc/rgrunt/rb_killed4.wav"}
	self.SoundTbl_AllyDeath = {"vj_hlr/hl1_npc/rgrunt/rb_allydeath1.wav"}
	self.SoundTbl_Pain = {"vj_hlr/hl1_npc/rgrunt/spark1.wav","vj_hlr/hl1_npc/rgrunt/spark2.wav","vj_hlr/hl1_npc/rgrunt/spark3.wav","vj_hlr/hl1_npc/rgrunt/spark4.wav","vj_hlr/hl1_npc/rgrunt/spark5.wav","vj_hlr/hl1_npc/rgrunt/spark6.wav"}
	self.SoundTbl_Death = {"vj_hlr/hl1_npc/rgrunt/rb_die1.wav","vj_hlr/hl1_npc/rgrunt/rb_die2.wav","vj_hlr/hl1_npc/rgrunt/rb_die3.wav"}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_CustomOnThink()
	if self.HECU_NextMouthMove > CurTime() then
		local changeTo = self:GetSkin() + 1
		if changeTo > 3 then
			changeTo = 1
		end
		self:SetSkin(changeTo)
	else
		self:SetSkin(0)
	end
	
	-- Take damage if in water
	if self:WaterLevel() == 3 then
		self:SetHealth(self:Health() - 1)
		if self:Health() <= 0 then -- Actually kill it
			self:TakeDamage(1, self, self)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnPlayCreateSound(sdData, sdFile)
	if VJ_HasValue(self.SoundTbl_Breath, sdFile) or VJ_HasValue(self.SoundTbl_Pain, sdFile) then return end

	self.HECU_NextMouthMove = CurTime() + SoundDuration(sdFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:CustomOnTakeDamage_BeforeImmuneChecks(dmginfo, hitgroup)
	if dmginfo:GetDamagePosition() != vec then
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(4) -- Size
		rico:SetMagnitude(math.random(1, 2)) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_HLR_Rico", rico)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	local spr = ents.Create("env_sprite")
	spr:SetKeyValue("model","vj_hl/sprites/zerogxplode.vmt")
	spr:SetKeyValue("GlowProxySize","2.0")
	spr:SetKeyValue("HDRColorScale","1.0")
	spr:SetKeyValue("renderfx","14")
	spr:SetKeyValue("rendermode","5")
	spr:SetKeyValue("renderamt","255")
	spr:SetKeyValue("disablereceiveshadows","0")
	spr:SetKeyValue("mindxlevel","0")
	spr:SetKeyValue("maxdxlevel","0")
	spr:SetKeyValue("framerate","20.0")
	spr:SetKeyValue("spawnflags","0")
	spr:SetKeyValue("scale","1.5")
	spr:SetPos(self:GetPos() + self:GetUp()*60)
	spr:Spawn()
	spr:Fire("Kill","",0.7)
	timer.Simple(0.7, function() if IsValid(spr) then spr:Remove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibsCollideSd = {"vj_hlr/fx/metal1.wav","vj_hlr/fx/metal2.wav","vj_hlr/fx/metal3.wav","vj_hlr/fx/metal4.wav","vj_hlr/fx/metal5.wav"}
--
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local spr = ents.Create("env_sprite")
		spr:SetKeyValue("model","vj_hl/sprites/zerogxplode.vmt")
		spr:SetKeyValue("GlowProxySize","2.0")
		spr:SetKeyValue("HDRColorScale","1.0")
		spr:SetKeyValue("renderfx","14")
		spr:SetKeyValue("rendermode","5")
		spr:SetKeyValue("renderamt","255")
		spr:SetKeyValue("disablereceiveshadows","0")
		spr:SetKeyValue("mindxlevel","0")
		spr:SetKeyValue("maxdxlevel","0")
		spr:SetKeyValue("framerate","20.0")
		spr:SetKeyValue("spawnflags","0")
		spr:SetKeyValue("scale","2")
		spr:SetPos(self:GetPos() + self:GetUp()*60)
		spr:Spawn()
		spr:Fire("Kill","",0.7)
		timer.Simple(0.7, function() if IsValid(spr) then spr:Remove() end end)
	end
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p1_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p2_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p3_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,50)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p4_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p5_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p6_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,45)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p7_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,45)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p8_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,45)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p9_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,45)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p10_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/metalgib_p11_g.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,40)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_cog1.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,60)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_cog2.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_rib.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_screw.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_screw.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_screw.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=gibsCollideSd})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/rgib_spring.mdl",{BloodDecal="",Pos=self:LocalToWorld(Vector(0,0,15)),CollideSound=""}) -- Shad ge sharji, ere vor tsayn chi hane
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibs = {"models/vj_hlr/gibs/metalgib_p1_g.mdl", "models/vj_hlr/gibs/metalgib_p2_g.mdl", "models/vj_hlr/gibs/metalgib_p3_g.mdl", "models/vj_hlr/gibs/metalgib_p4_g.mdl", "models/vj_hlr/gibs/metalgib_p5_g.mdl", "models/vj_hlr/gibs/metalgib_p6_g.mdl", "models/vj_hlr/gibs/metalgib_p7_g.mdl", "models/vj_hlr/gibs/metalgib_p8_g.mdl", "models/vj_hlr/gibs/metalgib_p9_g.mdl", "models/vj_hlr/gibs/metalgib_p10_g.mdl", "models/vj_hlr/gibs/metalgib_p11_g.mdl", "models/vj_hlr/gibs/rgib_cog1.mdl", "models/vj_hlr/gibs/rgib_cog2.mdl", "models/vj_hlr/gibs/rgib_rib.mdl", "models/vj_hlr/gibs/rgib_screw.mdl", "models/vj_hlr/gibs/rgib_screw.mdl", "models/vj_hlr/gibs/rgib_screw.mdl"}
--
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	ParticleEffectAttach("smoke_exhaust_01a", PATTACH_POINT_FOLLOW, corpseEnt, 5)
	VJ_HLR_ApplyCorpseEffects(self, corpseEnt, gibs, {CollideSound = gibsCollideSd, ExpSound = {"vj_hlr/hl1_npc/rgrunt/rb_gib.wav"}})
end