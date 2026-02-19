# ═══════════════════════════════════════════════════
# Home: Go (v2.5.7)
# Usage: /function custom_admin:api/home/go {name:"isim"}
# Permission: VIP+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"red"},{text:"⏳ Bekleme süresi dolmadı!",color:"yellow"}]
execute if score @s gulce_cooldown matches 1.. run return 0

function glc_menu:handler/utils/player_name
data modify storage glc:temp home_go.player set from storage glc_menu:names temp.NAME
$data modify storage glc:temp home_go.name set value "$(name)"
function custom_admin:api/home/go_check with storage glc:temp home_go
data remove storage glc:temp home_go
