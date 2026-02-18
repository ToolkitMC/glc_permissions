# ═══════════════════════════════════════════════════
# Ban Enforce - Nacro (MACRO)
# DÜZELTİLDİ v2.5.7: ban @s selector hata → player_name ile isim al
# @s: banlı oyuncu (glc.banned tag'li), lang=$(lang) macro parametresi
# ═══════════════════════════════════════════════════

$data modify storage glc:temp lang set value "$(lang)"

# Oyuncunun adını al (player_name sistemi)
function glc_menu:handler/utils/player_name

# İsmini temp storage'a kopyala
data modify storage glc:temp ban_target set from storage glc_menu:names temp.NAME

# Ban uygula (macro ile isim kullan)
function custom_admin:api/warn/ban_enforce_do with storage glc:temp
