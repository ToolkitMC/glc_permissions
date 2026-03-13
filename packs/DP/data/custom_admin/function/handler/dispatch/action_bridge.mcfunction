# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — action_bridge.mcfunction
# Mevcut execute/action akışına köprü kurar.
# args:{id:"eylem_id"}  → glc:temp id olarak yazar, ardından parser çalıştırır
#
# Kullanım:
#   data modify storage glc:dispatch Route set value \
#       {type:"action/run",args:{id:"my_action"}}
#   function custom_admin:handler/dispatch/main
# ─────────────────────────────────────────────────────────────────
# 1.21.8 FIX: $(args.id) noktalı syntax kaldırıldı.
# args.id önce flat storage'a kopyalanır, sonra MACRO flat key ile yazılır.
# ═══════════════════════════════════════════════════════════════════

# args.id'yi flat storage'a kopyala
data modify storage glc:dispatch flat.id set from storage glc:dispatch Route.args.id

# Flat MACRO ile glc:temp id'ye yaz
function custom_admin:handler/dispatch/action_bridge_run with storage glc:dispatch flat

# Temizlik
data remove storage glc:dispatch flat

# Mevcut eylem yürütücüsünü çalıştır (ID check + type dispatch içerir)
function custom_admin:handler/run/parser
