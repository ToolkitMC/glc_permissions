# ═══════════════════════════════════════════════════
# Report: Save (macro)
# Macro: {reporter:"...", target:"...", reason:"..."}
# ═══════════════════════════════════════════════════

$data modify storage glc:data reports append value {reporter:"$(reporter)",target:"$(target)",reason:"$(reason)",timestamp:0,reviewed:0b}
execute store result storage glc:data reports[-1].timestamp int 1 run time query gametime

# Tüm modlara alert
$tellraw @a[tag=gulce_mod] ['',{text:"[📋 RAPOR] ",color:"gold",bold:true},{text:"$(reporter)",color:"aqua"},{text:" → ",color:"gray"},{text:"$(target)",color:"red"},{text:" | ",color:"dark_gray"},{text:"$(reason)",color:"white"}]
$tellraw @a[tag=gulce_mod] ['',{text:"  ",color:"dark_gray"},{text:"[İncele]",color:"yellow",bold:true,click_event:{action:"run_command",command:"/function custom_admin:api/report/list"}},{text:"  [Spectate]",color:"aqua",bold:true,click_event:{action:"run_command",command:"/function custom_admin:features/spectate/watch {player:\"$(target)\"}"},hover_event:{action:"show_text",value:"$(target) izle"}}]
execute as @a[tag=gulce_mod] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
