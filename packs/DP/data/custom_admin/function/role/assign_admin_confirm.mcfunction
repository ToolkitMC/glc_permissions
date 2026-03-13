# ═══════════════════════════════════════════════════
# Role: Assign ADMIN - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/assign_admin_do",action_tr:"$(player) adlı oyuncuya ADMIN rolü ver",action_en:"Assign ADMIN role to $(player)",action_de:"ADMIN-Rolle an $(player) vergeben"}
