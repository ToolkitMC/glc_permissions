# ═══════════════════════════════════════════════════
# Permission Parser - Storage'den tag uygular
# Her tick permissions listesini okur, oyunculara tag atar
# ═══════════════════════════════════════════════════

# Geçici liste kopyala
data modify storage glc:temp perm_parse.list set from storage glc:data permissions

# İlk permission'ı işle
execute if data storage glc:temp perm_parse.list[0] run function custom_admin:handler/parser/permissions_loop

# Temizlik
data remove storage glc:temp perm_parse
