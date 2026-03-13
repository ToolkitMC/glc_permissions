# ═══════════════════════════════════════════════════
# Cleanup Deleted - YENİ v2.5.4
# Loop bittikten SONRA işaretli action'ları sil
# ═══════════════════════════════════════════════════

# Silinecek sayısını say
execute store result score #delete_count gulce_id if data storage glc:data scheduled[{delete:1b}]

# Eğer silinecek varsa, temizle
execute if score #delete_count gulce_id matches 1.. run function custom_admin:handler/schedule/do_cleanup

# Flag'i sıfırla
scoreboard players set #delete_count gulce_id 0
