# Home item sağ tık → Home panelini aç
execute if predicate glc_menu:glc_home if score @s glc.used.home matches 1.. run trigger gulce_menu set 31
