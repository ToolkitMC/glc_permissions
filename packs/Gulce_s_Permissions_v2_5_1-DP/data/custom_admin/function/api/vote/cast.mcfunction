# ═══════════════════════════════════════════════════
# Vote: Cast Vote (v2.5.8)
# ═══════════════════════════════════════════════════

# Skoru geçici yere kopyala
scoreboard players operation #glc.vote_val glc.timer = @s glc.vote

# Trigger'ı hemen sıfırla
scoreboard players set @s glc.vote 0
scoreboard players enable @s glc.vote

execute unless data storage glc:vote active if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[OY] ",color:"gray"},{text:"Aktif oylama yok.",color:"gray"}]
execute unless data storage glc:vote active if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VOTE] ",color:"gray"},{text:"No active vote.",color:"gray"}]
execute unless data storage glc:vote active if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[ABSTIMMUNG] ",color:"gray"},{text:"Keine aktive Abstimmung.",color:"gray"}]
execute unless data storage glc:vote active run return 0

execute if entity @s[tag=glc.voting] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[OY] ",color:"red"},{text:"⚠ Zaten oy kullandınız!",color:"yellow"}]
execute if entity @s[tag=glc.voting] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VOTE] ",color:"red"},{text:"⚠ You already voted!",color:"yellow"}]
execute if entity @s[tag=glc.voting] if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[ABSTIMMUNG] ",color:"red"},{text:"⚠ Du hast bereits abgestimmt!",color:"yellow"}]
execute if entity @s[tag=glc.voting] run return 0

tag @s add glc.voting

execute if score #glc.vote_val glc.timer matches 1 run function custom_admin:api/vote/add_yes
execute if score #glc.vote_val glc.timer matches 2 run function custom_admin:api/vote/add_no

scoreboard players reset #glc.vote_val glc.timer
