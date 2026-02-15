# ═══════════════════════════════════════════════════
# Menu Notify (FIXED v1.1 - No clickEvent)
# Purpose: Menu opened notification
# Parameters: macro from storage
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Success message
$tellraw $(NAME) ["",{"text":"[GULCE-MENU] ","color":"gold","bold":true},{"text":"Menü açıldı!","color":"green"}]

# Info message (clickEvent REMOVED - dialog API handles menu)
$tellraw $(NAME) ["",{"text":"Tekrar açmak için: ","color":"yellow"},{"text":"/trigger gulce_menu","color":"aqua"}]

# Debug log
$execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Menu opened by $(NAME)"}