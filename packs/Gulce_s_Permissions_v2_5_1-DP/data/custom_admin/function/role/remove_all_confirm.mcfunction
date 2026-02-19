# ═══════════════════════════════════════════════════
# Role: Remove All Roles - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/remove_all_do",action_tr:"$(player) adlı oyuncunun TÜM rolleri kaldırılacak!",action_en:"ALL roles of $(player) will be removed!",action_de:"ALLE Rollen von $(player) werden entfernt!"}
