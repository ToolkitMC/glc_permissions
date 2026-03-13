# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — action_bridge_run.mcfunction  (MACRO)
# Çağrı: function ...action_bridge_run with storage glc:dispatch flat
# Flat key: $(id)
# 1.21.8 FIX: Noktalı MACRO syntax'ı yok.
# ═══════════════════════════════════════════════════════════════════

$data modify storage glc:temp id set value "$(id)"
