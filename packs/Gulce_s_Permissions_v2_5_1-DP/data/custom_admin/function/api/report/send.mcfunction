# ═══════════════════════════════════════════════════
# Report: Send Player Report (v2.5.7)
# Usage: /function custom_admin:api/report/send {target:"OyuncuAdi",reason:"sebep"}
# Permission: Tüm oyuncular
# ═══════════════════════════════════════════════════

# Cooldown
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[RAPOR] ",color:"red"},{text:"⏳ Çok sık rapor gönderiyorsunuz!",color:"yellow"}]
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[REPORT] ",color:"red"},{text:"⏳ Too many reports!",color:"yellow"}]
execute if score @s gulce_cooldown matches 1.. run return 0

# Hedef var mı?
$execute unless entity @a[name=$(target),limit=1] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[RAPOR] ",color:"red"},{text:"Oyuncu bulunamadı: ",color:"gray"},{text:"$(target)",color:"yellow"}]
$execute unless entity @a[name=$(target),limit=1] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[REPORT] ",color:"red"},{text:"Player not found: ",color:"gray"},{text:"$(target)",color:"yellow"}]
$execute unless entity @a[name=$(target),limit=1] run return 0

# Raporu storage'a ekle
function glc_menu:handler/utils/player_name
data modify storage glc:temp report.reporter set from storage glc_menu:names temp.NAME
$data modify storage glc:temp report.target set value "$(target)"
$data modify storage glc:temp report.reason set value "$(reason)"
function custom_admin:api/report/save with storage glc:temp report
data remove storage glc:temp report

# Gönderene onay
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[RAPOR] ",color:"green",bold:true},{text:"✅ Rapor iletildi. Teşekkürler!",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[REPORT] ",color:"green",bold:true},{text:"✅ Report submitted. Thank you!",color:"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[MELDUNG] ",color:"green",bold:true},{text:"✅ Meldung eingereicht. Danke!",color:"green"}]
execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1

scoreboard players set @s gulce_cooldown 200
