#include "..\description\configDefs.hpp";
call phx_fnc_loadout_vars; //sets the variables the loadout system uses

//Set _this role from class of their unit
_pClass = typeOf _this;
if (_pClass == UNIT_OPFOR_PL || _pClass == UNIT_BLUFOR_PL || _pClass == UNIT_INDFOR_PL) then {pRole = ROLE_PL};
if (_pClass == UNIT_OPFOR_SL || _pClass == UNIT_BLUFOR_SL || _pClass == UNIT_INDFOR_SL) then {pRole = ROLE_SL};
if (_pClass == UNIT_OPFOR_TL || _pClass == UNIT_BLUFOR_TL || _pClass == UNIT_INDFOR_TL) then {pRole = ROLE_TL};
if (_pClass == UNIT_OPFOR_MGTL || _pClass == UNIT_BLUFOR_MGTL || _pClass == UNIT_INDFOR_MGTL) then {pRole = ROLE_MGTL};
if (_pClass == UNIT_OPFOR_CLS || _pClass == UNIT_BLUFOR_CLS || _pClass == UNIT_INDFOR_CLS) then {pRole = ROLE_CLS};
if (_pClass == UNIT_OPFOR_AR || _pClass == UNIT_BLUFOR_AR || _pClass == UNIT_INDFOR_AR) then {pRole = ROLE_AR};
if (_pClass == UNIT_OPFOR_AAR || _pClass == UNIT_BLUFOR_AAR || _pClass == UNIT_INDFOR_AAR) then {pRole = ROLE_AAR};
if (_pClass == UNIT_OPFOR_MG || _pClass == UNIT_BLUFOR_MG || _pClass == UNIT_INDFOR_MG) then {pRole = ROLE_MG};
if (_pClass == UNIT_OPFOR_AM || _pClass == UNIT_BLUFOR_AM || _pClass == UNIT_INDFOR_AM) then {pRole = ROLE_AM};
if (_pClass == UNIT_OPFOR_RAT || _pClass == UNIT_BLUFOR_RAT || _pClass == UNIT_INDFOR_RAT) then {pRole = ROLE_RAT};
if (_pClass == UNIT_OPFOR_CE || _pClass == UNIT_BLUFOR_CE || _pClass == UNIT_INDFOR_CE) then {pRole = ROLE_CE};
if (_pClass == UNIT_OPFOR_AT || _pClass == UNIT_BLUFOR_AT || _pClass == UNIT_INDFOR_AT) then {pRole = ROLE_AT};
if (_pClass == UNIT_OPFOR_AAT || _pClass == UNIT_BLUFOR_AAT || _pClass == UNIT_INDFOR_AAT) then {pRole = ROLE_AAT};
if (_pClass == UNIT_OPFOR_R || _pClass == UNIT_BLUFOR_R || _pClass == UNIT_INDFOR_R) then {pRole = ROLE_R};
if (_pClass == UNIT_OPFOR_CR || _pClass == UNIT_BLUFOR_CR || _pClass == UNIT_INDFOR_CR) then {pRole = ROLE_CR};
if (_pClass == UNIT_OPFOR_MK || _pClass == UNIT_BLUFOR_MK || _pClass == UNIT_INDFOR_MK) then {pRole = ROLE_MK};
if (_pClass == UNIT_OPFOR_P || _pClass == UNIT_BLUFOR_P || _pClass == UNIT_INDFOR_P) then {pRole = ROLE_P};
if (!isNil "UNIT_OPFOR_GR") then {
  if (_pClass in [UNIT_OPFOR_GR,UNIT_BLUFOR_GR,UNIT_INDFOR_GR]) then {pRole = ROLE_GR};
};
if (_pClass == UNIT_CIV_R) then {pRole = ROLE_CIV};

if (isNil "pRole") exitWith {
  hint "_this role not set correctly. Alert the mission maker and join another slot.";
  _this enableSimulation false;
  endMission "END1"
};
_this linkItem "ItemMap";

if (pRole in [ROLE_PL,ROLE_SL,ROLE_TL,ROLE_MGTL]) then {phx_loadout_hasUGL = true} else {phx_loadout_hasUGL = false};
if (pRole in [ROLE_AR,ROLE_MG,ROLE_MK,ROLE_P]) then {phx_loadout_hasSpecial = true} else {phx_loadout_hasSpecial = false};

if (pRole == ROLE_CIV) exitWith {};

phx_loadout_unitLevel = 0;
if (pRole in [ROLE_PL,ROLE_SL]) then {phx_loadout_unitLevel = 2};
if (pRole in [ROLE_TL,ROLE_MGTL]) then {phx_loadout_unitLevel = 1};
//Shared
phx_loadout_aid = "FirstAidKit:3";
phx_loadout_smoke = "SmokeShell";
phx_loadout_grenade = "";
phx_loadout_CEGrenade = "";
phx_loadout_maptools = "ACE_MapTools";
phx_loadout_cableTie = "ACE_CableTie:2";
//CE
phx_loadout_explosives = ["2x TNT, 4 lb","LIB_US_TNT_4pound_mag:2"];
phx_loadout_APMines = ["2x AP mine","LIB_US_M3_MINE_mag:2"];
phx_loadout_ATMines = ["2x AT mine","LIB_US_M1A1_ATMINE_mag:2"];
phx_loadout_defusalkit = "ACE_DefusalKit";
phx_loadout_trigger = "ACE_LIB_LadungPM";
phx_loadout_entrenching = "ACE_EntrenchingTool";
phx_loadout_detector = "MineDetector";
phx_loadout_fuse = "ACE_LIB_FireCord";
//Medic
phx_loadout_PAK = "ACE_personalAidKit";
phx_loadout_bandage = "ACE_fieldDressing:28";
phx_loadout_morphine = "ACE_morphine:12";
phx_loadout_epinephrine = "ACE_epinephrine:5";
phx_loadout_blood_1 = "ACE_bloodIV_500:10";
phx_loadout_blood_2 = "";
//Range
phx_loadout_binocular = "Binocular";
phx_loadout_rifle_optic = "";
phx_selector_optics = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high", "rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"];
phx_selector_magOptics = ["rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230_mrds", "optic_MRCO", "optic_Hamr", "optic_Arco_blk_F", "rhsusf_acc_ELCAN", "rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak"];
phx_selector_explosives = [
phx_loadout_explosives,
phx_loadout_APMines,
phx_loadout_ATMines,
["4x 250g charge", "LIB_Ladung_Small_MINE_mag:4"]
];
// "debug_console" callExtension (str _this + "#1111");
_this call compile preprocessFileLineNumbers "previewFNFLoadoutsEden\fn_setUniform.sqf"; 
_this call compile preprocessFileLineNumbers "previewFNFLoadoutsEden\fn_setWeapons.sqf"; 