# ═══════════════════════════════════════════════════
# Broadcast API - {message:"...", sender:"@s"|"isim"}
# MOD+ yetkisi gereklidir
# ═══════════════════════════════════════════════════

execute unless score @s gulce_permission_level matches 3.. run return fail

$tellraw @a ["",{"text":"[DUYURU] ","color":"gold","bold":true},{"text":"$(message)","color":"yellow"}]
$tellraw @a[tag=gulce_mod] ["",{"text":"[LOG] ","color":"dark_gray"},{"text":"Duyuru → ","color":"gray"},{"text":"$(message)","color":"white"},{"text":" (by $(sender))","color":"dark_gray"}]
execute as @a at @s run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.2

# Rate limit sayacı
scoreboard players add @s glc.rate_bc 1
