# Vote item sağ tık → Vote panelini aç
execute if predicate glc_menu:glc_vote if score @s glc.used.vote matches 1.. run trigger gulce_menu set 32
