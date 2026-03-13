# ═══════════════════════════════════════════════════
# Role: Assign VIP - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/assign_vip_do",action_tr:"$(player) adlı oyuncuya VIP rolü ver",action_en:"Assign VIP role to $(player)",action_de:"VIP-Rolle an $(player) vergeben"}
