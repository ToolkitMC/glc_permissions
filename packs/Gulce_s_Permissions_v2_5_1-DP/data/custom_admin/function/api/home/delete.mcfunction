# ═══════════════════════════════════════════════════
# Home: Delete (v2.5.7)
# Usage: /function custom_admin:api/home/delete {name:"isim"}
# Permission: VIP+ (kendi evi), ADMIN+ (başkasının)
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

function glc_menu:handler/utils/player_name
data modify storage glc:temp home_del.player set from storage glc_menu:names temp.NAME
$data modify storage glc:temp home_del.name set value "$(name)"
function custom_admin:api/home/delete_do with storage glc:temp home_del
data remove storage glc:temp home_del
