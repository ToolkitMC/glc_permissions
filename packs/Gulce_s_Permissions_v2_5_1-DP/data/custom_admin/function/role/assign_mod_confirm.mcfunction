# ═══════════════════════════════════════════════════
# Role: Assign MOD - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/assign_mod_do",action_tr:"$(player) adlı oyuncuya MOD rolü ver",action_en:"Assign MOD role to $(player)",action_de:"MOD-Rolle an $(player) vergeben"}
