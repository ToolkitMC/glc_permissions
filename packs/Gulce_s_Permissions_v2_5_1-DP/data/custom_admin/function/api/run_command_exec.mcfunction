# ═══════════════════════════════════════════════════
# API: Run Command Exec (macro)
# Macro: {cmd:"...", selector:"...", sound:"..."}
# ═══════════════════════════════════════════════════

$execute as @a[name=$(selector),limit=1] run $(cmd)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"green"},{text:"✅ Komut çalıştırıldı: ",color:"gray"},{text:"$(cmd)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"green"},{text:"✅ Command executed: ",color:"gray"},{text:"$(cmd)",color:"yellow"}]
$playsound $(sound) master @s ~ ~ ~ 1 1
