# unfreeze_by_name {player:"isim"}
$execute as @a[name=$(player),limit=1] run function custom_admin:features/mod/freeze_unfreeze
$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"⚠ Oyuncu bulunamadı: $(player)","color":"red"}
$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_en] run tellraw @s {"text":"⚠ Player not found: $(player)","color":"red"}
