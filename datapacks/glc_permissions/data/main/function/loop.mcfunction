# Admin Loop:
execute as @a at @s run function custom_admin:handler/loop/all/1

# Gulce Menu Loop:
execute as @a at @s run function glc_menu:handler/tick

# Menu Opener Loop:
execute as @a[scores={gulce.used=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{glcMenu:1b}}}}] run function #glc_menu:menu
scoreboard players set @a[scores={gulce.used=1..}] gulce.used 0