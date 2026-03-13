# ═══════════════════════════════════════════════════
# Role: Assign PLAYER - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/assign_player_do",action_tr:"$(player) adlı oyuncunun rolü PLAYER yapılacak (tüm yetkiler alınır)",action_en:"$(player) will be set to PLAYER role (all permissions removed)",action_de:"$(player) wird auf PLAYER gesetzt (alle Rechte werden entfernt)"}
