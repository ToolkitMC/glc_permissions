# ═══════════════════════════════════════════════════
# Do Cleanup - YENİ v2.5.4
# İşaretli scheduled action'ları sil
# ═══════════════════════════════════════════════════

# Yeni bir temiz array oluştur
data modify storage glc:temp temp.clean_scheduled set value []

# Tüm schedule'ları kopyala ve işaretli olmayanları filtrele
data modify storage glc:temp temp.processing set from storage glc:data scheduled

# Cleanup loop başlat
function custom_admin:handler/schedule/cleanup_loop
