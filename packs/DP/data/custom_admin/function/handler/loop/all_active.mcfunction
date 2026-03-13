# ═══════════════════════════════════════════════════
# GULCE Admin Power - Active Loop (v2.5.4)
# Sistem aktif ve oyuncu varsa çalışır
# ═══════════════════════════════════════════════════

# Trigger kontrolü
execute as @a[scores={gulce_trigger=1..}] run function custom_admin:handler/run/trigger

# Ana döngüleri çalıştır
function custom_admin:handler/loop/main
function custom_admin:handler/loop/permissions
function custom_admin:handler/group/check
