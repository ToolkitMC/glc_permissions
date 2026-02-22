# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — role_assign.mcfunction
# Kullanım örneği:
#   data modify storage glc:dispatch Route set value \
#       {type:"role/assign",args:{target:"Oyuncu",role:"admin"}}
#   function custom_admin:handler/dispatch/main
# ─────────────────────────────────────────────────────────────────
# 1.21.8 FIX: $(args.x) noktalı MACRO syntax'ı kaldırıldı.
# args.target ve args.role önce flat storage'a kopyalanır,
# ardından with storage ile flat key olarak çağrılır.
# ═══════════════════════════════════════════════════════════════════

# args'ı flat storage'a kopyala
data modify storage glc:dispatch flat.target set from storage glc:dispatch Route.args.target
data modify storage glc:dispatch flat.role   set from storage glc:dispatch Route.args.role

# Owner atama sadece owner yapabilir — flat.role kontrol
execute if data storage glc:dispatch {flat:{role:"owner"}} \
    unless entity @s[tag=gulce_owner] \
    run function custom_admin:util/feedback/error \
        {message:"Sadece owner bu rolü atayabilir / Only owner can assign this role"}

execute if data storage glc:dispatch {flat:{role:"owner"}} \
    unless entity @s[tag=gulce_owner] \
    run return 0

# Rol dağıtımı — flat storage ile çağır
execute if data storage glc:dispatch {flat:{role:"admin"}} \
    run function custom_admin:handler/dispatch/role_assign_run with storage glc:dispatch flat

execute if data storage glc:dispatch {flat:{role:"mod"}} \
    run function custom_admin:handler/dispatch/role_assign_run with storage glc:dispatch flat

execute if data storage glc:dispatch {flat:{role:"vip"}} \
    run function custom_admin:handler/dispatch/role_assign_run with storage glc:dispatch flat

execute if data storage glc:dispatch {flat:{role:"player"}} \
    run function custom_admin:handler/dispatch/role_assign_run with storage glc:dispatch flat

execute if data storage glc:dispatch {flat:{role:"owner"}} \
    run function custom_admin:handler/dispatch/role_assign_run with storage glc:dispatch flat

# Temizlik
data remove storage glc:dispatch flat
