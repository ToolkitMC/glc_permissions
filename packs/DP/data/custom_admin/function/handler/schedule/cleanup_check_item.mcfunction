# ═══════════════════════════════════════════════════
# Cleanup Check Item - Tek item kontrol et
# ═══════════════════════════════════════════════════

# İlk item'ı al
data modify storage glc:temp temp.current_item set from storage glc:temp temp.processing[0]

# Eğer delete flag'i yoksa veya 0 ise, temiz listeye ekle
execute unless data storage glc:temp temp.current_item{delete:1b} run data modify storage glc:temp temp.clean_scheduled append from storage glc:temp temp.current_item

# İşlenmiş item'ı kaldır
data remove storage glc:temp temp.processing[0]

# Devam et
execute if data storage glc:temp temp.processing[0] run function custom_admin:handler/schedule/cleanup_loop

# Loop bittiyse finalize et
execute unless data storage glc:temp temp.processing[0] run function custom_admin:handler/schedule/cleanup_finalize
