# ═══════════════════════════════════════════════════
# Tag Uygulama - Tüm gruplara
# ═══════════════════════════════════════════════════

# Counter sıfırla
scoreboard players set #group_tick_counter gulce_id 0

# İlk grubu al
data modify storage glc:temp temp.current_group set from storage glc:data groups[0]

# Bu gruba tag uygula
function custom_admin:handler/group/apply_single_group with storage glc:temp temp.current_group

# Listeden çıkar
data modify storage glc:temp temp.groups_remaining set from storage glc:data groups
data remove storage glc:temp temp.groups_remaining[0]

# Kalan grup varsa devam et
execute if data storage glc:temp temp.groups_remaining[0] run function custom_admin:handler/group/apply_tags_loop