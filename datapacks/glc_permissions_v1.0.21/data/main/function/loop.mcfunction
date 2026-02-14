# Ana tick fonksiyonu
# Oyuncu kontrolü
execute unless entity @a run return 0

# Admin Loop
execute if score #main glc.loop matches ..0 run scoreboard players set #main glc.loop 20
execute if score #main glc.loop matches 20 as @a at @s run function custom_admin:handler/loop/all/1
scoreboard players remove #main glc.loop 1

# Gulce Menu Loop
execute if score #glc glc.loop matches ..0 run scoreboard players set #glc glc.loop 10
execute if score #glc glc.loop matches 10 as @a at @s run function glc_menu:handler/tick
scoreboard players remove #glc glc.loop 1

# Menu Opener
execute as @a[scores={gulce.used=1..},predicate=glc_menu:holding_menu_item] run function #glc_menu:menu
scoreboard players set @a[scores={gulce.used=1..}] gulce.used 0