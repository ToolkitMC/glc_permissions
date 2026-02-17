# ═══════════════════════════════════════════════════
# TP From Storage (v1.2.0) - Macro: {loc:"<name>"}
# Doğrudan storage'dan x/y/z macro argümanı oluşturur
# ═══════════════════════════════════════════════════
$data modify storage glc:temp tp set from storage glc:config teleport_locations.$(loc)
function custom_admin:features/vip/tp_apply_from_storage
