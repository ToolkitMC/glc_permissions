# ═══════════════════════════════════════════════════
# Grup Tag Yenileme - Her 5 saniyede bir
# ═══════════════════════════════════════════════════

# Tüm grup taglarını temizle
tag @a remove gulce_has_group

# Grupları kontrol et ve tag'leri uygula
execute if data storage glc:data groups[0] run function custom_admin:handler/group/apply_tags

# Debug log only (NO spam)
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Group tags refreshed"}