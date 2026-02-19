# ═══════════════════════════════════════════════════
# API: Send Message Exec (macro)
# ═══════════════════════════════════════════════════

$tellraw @a[name=$(selector)] [{text:"[GULCE MSG] ",color:"gold",bold:true},{text:"$(message)",color:"white"}]
$execute as @a[name=$(selector)] at @s run playsound $(sound) master @s ~ ~ ~ 1 1
