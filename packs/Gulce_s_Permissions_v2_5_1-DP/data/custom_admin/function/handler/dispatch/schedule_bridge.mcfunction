# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — schedule_bridge.mcfunction
# args:{action_id:"...", delay:20, player:"OyuncuAdi"}
#
# Kullanım:
#   data modify storage glc:dispatch Route set value \
#       {type:"schedule/add",args:{action_id:"my_action",delay:20,player:"Steve"}}
#   function custom_admin:handler/dispatch/main
# ─────────────────────────────────────────────────────────────────
# 1.21.8 FIX: $(args.x) noktalı syntax kaldırıldı.
# args alanları flat storage'a kopyalanır, MACRO flat key ile çağrılır.
# ═══════════════════════════════════════════════════════════════════

# args'ı flat storage'a kopyala
data modify storage glc:dispatch flat.action_id set from storage glc:dispatch Route.args.action_id
data modify storage glc:dispatch flat.delay     set from storage glc:dispatch Route.args.delay
data modify storage glc:dispatch flat.player    set from storage glc:dispatch Route.args.player

# Flat storage ile schedule/add çağır
function custom_admin:handler/dispatch/schedule_bridge_run with storage glc:dispatch flat

# Temizlik
data remove storage glc:dispatch flat
