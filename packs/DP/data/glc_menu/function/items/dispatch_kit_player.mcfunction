$execute unless entity @a[name=$(dk_player),limit=1] if entity @s[tag=glc.lang_tr] run return run tellraw @s {"text":"⚠ Oyuncu bulunamadı: $(dk_player)","color":"red"}
$execute unless entity @a[name=$(dk_player),limit=1] if entity @s[tag=glc.lang_en] run return run tellraw @s {"text":"⚠ Player not found: $(dk_player)","color":"red"}

$execute as @a[name=$(dk_player),limit=1] run function glc_menu:items/give_kit
