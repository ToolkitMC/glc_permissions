# ═══════════════════════════════════════════════════
# Vote: Add No (v2.5.7)
# ═══════════════════════════════════════════════════

scoreboard players add #vote_no glc.timer 1
execute store result storage glc:vote active.no int 1 run scoreboard players get #vote_no glc.timer

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[OY] ",color:"red"},{text:"❌ HAYIR oyu kaydedildi!",color:"red"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VOTE] ",color:"red"},{text:"❌ NO vote recorded!",color:"red"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[ABSTIMMUNG] ",color:"red"},{text:"❌ NEIN-Stimme erfasst!",color:"red"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8
