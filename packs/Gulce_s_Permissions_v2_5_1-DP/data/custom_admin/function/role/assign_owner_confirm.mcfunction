# ═══════════════════════════════════════════════════
# Role: Assign OWNER - Onaylı (v2.5.8)
# Macro: {player:"OyuncuAdi"}
# ⚠ EN YETKİLİ ROL - Çift onay zorunlu
# ═══════════════════════════════════════════════════
$data modify storage glc:confirm pending.args.player set value "$(player)"
$function custom_admin:handler/confirm/request {action:"custom_admin:role/assign_owner_do",action_tr:"⚠ $(player) adlı oyuncuya OWNER rolü verilecek! Bu işlem geri alınamaz!",action_en:"⚠ Assigning OWNER role to $(player)! This cannot be undone!",action_de:"⚠ OWNER-Rolle wird an $(player) vergeben! Nicht rückgängig machbar!"}
