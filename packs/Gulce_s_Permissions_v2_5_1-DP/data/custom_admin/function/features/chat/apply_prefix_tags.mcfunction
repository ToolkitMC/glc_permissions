# Prefix temizleme ve atama
execute as @a run tag @s remove glc.prefix_owner
execute as @a run tag @s remove glc.prefix_mod
execute as @a run tag @s remove glc.prefix_vip
execute as @a run tag @s remove glc.prefix_player
execute as @a run tag @s remove glc.prefix_none

execute as @a[tag=gulce_owner] run tag @s add glc.prefix_owner

execute as @a[tag=gulce_mod,tag=!gulce_owner] run tag @s add glc.prefix_mod

execute as @a[tag=gulce_vip,tag=!gulce_owner,tag=!gulce_mod] run tag @s add glc.prefix_vip

execute as @a[tag=gulce_player,tag=!gulce_owner,tag=!gulce_mod,tag=!gulce_vip] run tag @s add glc.prefix_player

execute as @a[tag=!gulce_owner,tag=!gulce_mod,tag=!gulce_vip,tag=!gulce_player] run tag @s add glc.prefix_none