# ═══════════════════════════════════════════════════
# Kick Action - Oyuncuyu sunucudan atar
# params: {reason:"Sebep mesajı"}
# player: Atılacak oyuncunun adı (selector değil, isim)
# NOT: kick komutu OP gerektirir (permission level 2+)
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.reason set from storage glc:temp temp.params.reason
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/kick_run with storage glc:temp temp
