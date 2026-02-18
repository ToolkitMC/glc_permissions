# ═══════════════════════════════════════════════════
# GULCE Admin Power - Main Tick Loop (SCHEDULED)
# v1.2.1 - Return 0 uyumluluk düzeltmesi
# ═══════════════════════════════════════════════════

# Flag kontrolü ve oyuncu kontrolü: Her şeyi tek execute'da yap
execute if score #admin_loop global matches 1 if entity @a run function custom_admin:handler/loop/all_active
