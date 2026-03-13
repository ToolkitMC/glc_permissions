# ═══════════════════════════════════════════════════
# TPA: Do TP (macro)
# Macro: {from:"GönderenAdı", to:"HedefAdı"}
# @s = hedef (kabul eden) — göndereni @s'e ışınla
# ═══════════════════════════════════════════════════

# @s konumunu geçici storage'a kaydet, from oraya ışınlansın
execute store result storage glc:temp tpa_dest.x double 0.001 run data get entity @s Pos[0] 1000
execute store result storage glc:temp tpa_dest.y double 0.001 run data get entity @s Pos[1] 1000
execute store result storage glc:temp tpa_dest.z double 0.001 run data get entity @s Pos[2] 1000

$execute as @a[name=$(from),limit=1] run function custom_admin:api/tpa/do_tp_run with storage glc:temp tpa_dest
data remove storage glc:temp tpa_dest

$execute as @a[name=$(from),tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ Işınlandınız!",color:"green"}]
$execute as @a[name=$(from),tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ Teleported!",color:"green"}]
$execute as @a[name=$(from),tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ Teleportiert!",color:"green"}]
$execute as @a[name=$(from)] at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
