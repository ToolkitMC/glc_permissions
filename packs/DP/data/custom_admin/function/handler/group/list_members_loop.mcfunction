# ═══════════════════════════════════════════════════
# Üye Listesi Loop
# ═══════════════════════════════════════════════════

# İlk üyeyi al ve göster
data modify storage glc:temp temp.member_name set from storage glc:temp temp.member_list[0]
function custom_admin:handler/group/display_member with storage glc:temp temp

# Listeden çıkar
data remove storage glc:temp temp.member_list[0]

# Devam et
execute if data storage glc:temp temp.member_list[0] run function custom_admin:handler/group/list_members_loop