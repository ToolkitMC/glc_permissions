# ═══════════════════════════════════════════════════
# Add Permission (WRAPPER for API v2.5.4)
# SYNTAX FIX: Önceki versiyonda validation/id sonrası #valid skoru
# #id_len üzerinden kontrol ediliyordu (yanlış referans).
# validation/level sonrası ise #valid skoru override edilip
# level validasyonu devre dışı bırakılıyordu.
# Düzeltme: validation fonksiyonları return fail ile kendileri çıkıyor —
# çağıran sadece #valid skorunu kontrol etmeli.
# ═══════════════════════════════════════════════════

# Validation: ID (zaten exist kontrolü de yapıyor)
$function custom_admin:internal/validation/id {id:"$(id)"}
execute if score #valid gulce_id matches 0 run return fail

# Validation: Level
$function custom_admin:internal/validation/level {level:$(level)}
execute if score #valid gulce_id matches 0 run return fail

# Validation geçti — yeni API'yi çağır
$function custom_admin:api/permission/add {id:"$(id)",player:"$(player)",permission:"$(permission)",level:$(level)}

return 0
