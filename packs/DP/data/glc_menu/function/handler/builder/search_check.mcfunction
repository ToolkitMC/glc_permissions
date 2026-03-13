# ═══════════════════════════════════════════════════
# Arama Eşleşme Kontrolü (MACRO)
# ═══════════════════════════════════════════════════
# Çağrı: function glc_menu:handler/builder/search_check with storage glc:ui temp
# Gerekli temp alanları: current_perm.id, current_perm.permission, current_perm.player,
#                        current_perm.level, search_query

# id alanı eşleşiyor mu?
$execute if data storage glc:ui {temp:{current_perm:{id:"$(search_query)"}}} run function glc_menu:handler/builder/add_button with storage glc:ui temp.current_perm
$execute if data storage glc:ui {temp:{current_perm:{id:"$(search_query)"}}} run scoreboard players add #search_results gulce_id 1
$execute if data storage glc:ui {temp:{current_perm:{id:"$(search_query)"}}} run return 0

# permission alanı eşleşiyor mu?
$execute if data storage glc:ui {temp:{current_perm:{permission:"$(search_query)"}}} run function glc_menu:handler/builder/add_button with storage glc:ui temp.current_perm
$execute if data storage glc:ui {temp:{current_perm:{permission:"$(search_query)"}}} run scoreboard players add #search_results gulce_id 1
$execute if data storage glc:ui {temp:{current_perm:{permission:"$(search_query)"}}} run return 0

# player alanı eşleşiyor mu?
$execute if data storage glc:ui {temp:{current_perm:{player:"$(search_query)"}}} run function glc_menu:handler/builder/add_button with storage glc:ui temp.current_perm
$execute if data storage glc:ui {temp:{current_perm:{player:"$(search_query)"}}} run scoreboard players add #search_results gulce_id 1
