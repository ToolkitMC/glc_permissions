# ═══════════════════════════════════════════════════
# Vote: Add Yes (v2.5.7)
# Scoreboard üzerinden sayar, sonucu storage'a yazar
# ═══════════════════════════════════════════════════

scoreboard players add #vote_yes glc.timer 1
execute store result storage glc:vote active.yes int 1 run scoreboard players get #vote_yes glc.timer

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[OY] ",color:"green"},{text:"✅ EVET oyu kaydedildi!",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VOTE] ",color:"green"},{text:"✅ YES vote recorded!",color:"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[ABSTIMMUNG] ",color:"green"},{text:"✅ JA-Stimme erfasst!",color:"green"}]
execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5
