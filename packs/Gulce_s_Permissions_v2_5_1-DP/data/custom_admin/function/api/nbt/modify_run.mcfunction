# ═══════════════════════════════════════════════════
# API: NBT Modify Run (macro)
# Macro: {file, player, sound, nbt, action, modify_nbt}
# Storage modify işlemi yapar
# ═══════════════════════════════════════════════════

$data modify storage $(file) $(modify_nbt) $(action) value $(nbt)

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"green"},{text:"✅ Storage güncellendi: ",color:"gray"},{text:"$(file)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"green"},{text:"✅ Storage updated: ",color:"gray"},{text:"$(file)",color:"yellow"}]

$execute if data storage glc:temp {sound_enabled:1b} run playsound $(sound) master @s ~ ~ ~ 1 1
