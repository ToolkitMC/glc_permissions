# ═══════════════════════════════════════════════════
# Cleanup Loop - İşaretli olmayanları filtrele
# ═══════════════════════════════════════════════════

# Eğer işlenecek veri varsa
execute if data storage glc:temp temp.processing[0] run function custom_admin:handler/schedule/cleanup_check_item
