# TPA item sağ tık → TPA panelini aç
execute if predicate glc_menu:glc_tpa if score @s glc.used.tpa matches 1.. run trigger gulce_menu set 30
