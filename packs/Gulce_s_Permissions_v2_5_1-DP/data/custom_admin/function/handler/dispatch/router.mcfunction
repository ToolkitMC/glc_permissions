# ═══════════════════════════════════════════════════════════════════
# GLC Action Dispatcher — router.mcfunction  (MACRO)
# Çağırma: function custom_admin:handler/dispatch/router with storage glc:dispatch Route
# Macro:   $(type)   →  rota dizisi
#          $(args)   →  opsiyonel, alt macro'lara aktarılır
# ═══════════════════════════════════════════════════════════════════

# ── DIALOG PANELLERİ ───────────────────────────────────────────────
# schedule ile yüklenir → dialog API'si tick sonrası gösterir

execute if data storage glc:dispatch Route{type:"dialog/main"} \
    run schedule function custom_admin:handler/dialog/load/main_menu 5t

execute if data storage glc:dispatch Route{type:"dialog/permissions"} \
    run function custom_admin:handler/dialog/load/permission_manager

execute if data storage glc:dispatch Route{type:"dialog/help"} \
    run function custom_admin:handler/dialog/load/help

execute if data storage glc:dispatch Route{type:"dialog/about"} \
    run function custom_admin:handler/dialog/load/about

execute if data storage glc:dispatch Route{type:"dialog/actions"} \
    run function custom_admin:handler/dialog/load/action_manager

# ── GLC MENÜ BUILDER'LARI ──────────────────────────────────────────
# glc_menu:handler/builder/* → dialog bazlı menüler

execute if data storage glc:dispatch Route{type:"menu/main"} \
    run function glc_menu:handler/builder/main

execute if data storage glc:dispatch Route{type:"menu/permissions"} \
    run function glc_menu:handler/builder/permissions

execute if data storage glc:dispatch Route{type:"menu/edit"} \
    run function glc_menu:handler/builder/edit

execute if data storage glc:dispatch Route{type:"menu/settings"} \
    run function glc_menu:handler/builder/settings

execute if data storage glc:dispatch Route{type:"menu/tpa"} \
    run function glc_menu:handler/builder/tpa_panel

execute if data storage glc:dispatch Route{type:"menu/home"} \
    run function glc_menu:handler/builder/home_panel

execute if data storage glc:dispatch Route{type:"menu/vote"} \
    run function glc_menu:handler/builder/vote_panel

execute if data storage glc:dispatch Route{type:"menu/warn"} \
    run function glc_menu:handler/builder/warn_panel

execute if data storage glc:dispatch Route{type:"menu/report"} \
    run function glc_menu:handler/builder/report_panel

execute if data storage glc:dispatch Route{type:"menu/nametag"} \
    run function glc_menu:handler/builder/nametag_panel

execute if data storage glc:dispatch Route{type:"menu/custom_action"} \
    run function glc_menu:handler/builder/custom_action_panel

# ── PANEL / FEATURE SAYFALAR ───────────────────────────────────────
# custom_admin:features/* → özellik panelleri

execute if data storage glc:dispatch Route{type:"panel/fun"} \
    run function custom_admin:features/fun/panel

execute if data storage glc:dispatch Route{type:"panel/automation"} \
    run function custom_admin:features/owner/automation_panel

execute if data storage glc:dispatch Route{type:"panel/players"} \
    run function custom_admin:features/mod/player_management

execute if data storage glc:dispatch Route{type:"panel/effects"} \
    run function custom_admin:features/vip/special_effects

execute if data storage glc:dispatch Route{type:"panel/teleport"} \
    run function custom_admin:features/vip/quick_teleport

execute if data storage glc:dispatch Route{type:"panel/system"} \
    run function custom_admin:features/owner/system_control

# ── ITEM PANELLERİ ─────────────────────────────────────────────────
# glc_menu:items/panels/* → item sağ tık panel'leri

execute if data storage glc:dispatch Route{type:"item/mod_kit"} \
    run function glc_menu:items/panels/mod_kit

execute if data storage glc:dispatch Route{type:"item/admin_panel"} \
    run function glc_menu:items/panels/admin_panel

execute if data storage glc:dispatch Route{type:"item/quick_action"} \
    run function glc_menu:items/panels/quick_action

execute if data storage glc:dispatch Route{type:"item/spy"} \
    run function glc_menu:items/spy

execute if data storage glc:dispatch Route{type:"item/broadcast"} \
    run function glc_menu:items/panels/broadcast

# ── ROL ATAMA ──────────────────────────────────────────────────────
# args:{target:"OyuncuAdi", role:"admin|mod|vip|player|owner"}

execute if data storage glc:dispatch Route{type:"role/assign"} \
    run function custom_admin:handler/dispatch/role_assign with storage glc:dispatch Route

# ── EYLEM YÜRÜTME ──────────────────────────────────────────────────
# args:{id:"eylem_id"} → mevcut execute/action akışına köprü kurar

execute if data storage glc:dispatch Route{type:"action/run"} \
    run function custom_admin:handler/dispatch/action_bridge with storage glc:dispatch Route

# ── ZAMANLI GÖREV ──────────────────────────────────────────────────

execute if data storage glc:dispatch Route{type:"schedule/add"} \
    run function custom_admin:handler/dispatch/schedule_bridge with storage glc:dispatch Route

execute if data storage glc:dispatch Route{type:"schedule/list"} \
    run function custom_admin:handler/schedule/list

# ── UTIL ───────────────────────────────────────────────────────────

execute if data storage glc:dispatch Route{type:"util/cleanup"} \
    run function custom_admin:util/cleanup

execute if data storage glc:dispatch Route{type:"util/settings"} \
    run function custom_admin:util/settings/show

execute if data storage glc:dispatch Route{type:"util/settings/reset"} \
    run function custom_admin:util/settings/reset
