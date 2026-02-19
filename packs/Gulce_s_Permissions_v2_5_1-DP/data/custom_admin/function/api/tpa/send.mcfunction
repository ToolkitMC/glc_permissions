# ═══════════════════════════════════════════════════
# TPA: Send Request (v2.5.7)
# Usage: /function custom_admin:api/tpa/send {to:"OyuncuAdi"}
# Permission: VIP+
# Storage: glc:tpa requests.{to}.from, requests.{to}.sent_at
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"🚫 Bu özellik VIP+ içindir!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"🚫 VIP+ required!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"🚫 VIP+ erforderlich!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"⏳ Bekleme süresi dolmadı!",color:"yellow"}]
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"⏳ Please wait!",color:"yellow"}]
execute if score @s gulce_cooldown matches 1.. run return 0

$execute unless entity @a[name=$(to),limit=1] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"⚠️ Oyuncu bulunamadı: ",color:"gray"},{text:"$(to)",color:"yellow"}]
$execute unless entity @a[name=$(to),limit=1] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"⚠️ Player not found: ",color:"gray"},{text:"$(to)",color:"yellow"}]
$execute unless entity @a[name=$(to),limit=1] if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"⚠️ Spieler nicht gefunden: ",color:"gray"},{text:"$(to)",color:"yellow"}]
$execute unless entity @a[name=$(to),limit=1] run return 0

# Gönderenin adını al
function glc_menu:handler/utils/player_name
data modify storage glc:temp tpa_send.from set from storage glc_menu:names temp.NAME
$data modify storage glc:temp tpa_send.to set value "$(to)"

# Per-target storage'a yaz (çakışma önler)
function custom_admin:api/tpa/send_write with storage glc:temp tpa_send
data remove storage glc:temp tpa_send

scoreboard players set @s gulce_cooldown 100
