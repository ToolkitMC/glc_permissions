# ═══════════════════════════════════════════════════
# İzin Kontrolü Loop'u
# ═══════════════════════════════════════════════════

# Önce eski tag'leri temizle
tag @a remove gulce_permitted

# Sonra storage'deki izinlere göre yeni tag'leri uygula
execute if data storage glc:data permissions[0] run function custom_admin:handler/parser/permissions
