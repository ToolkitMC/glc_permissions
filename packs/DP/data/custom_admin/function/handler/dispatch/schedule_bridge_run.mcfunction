# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — schedule_bridge_run.mcfunction  (MACRO)
# Çağrı: function ...schedule_bridge_run with storage glc:dispatch flat
# Flat key'ler: $(action_id), $(delay), $(player)
# 1.21.8 FIX: Noktalı MACRO syntax'ı yok.
# ═══════════════════════════════════════════════════════════════════

$function custom_admin:api/schedule/add {action_id:"$(action_id)",delay:$(delay),player:"$(player)"}
