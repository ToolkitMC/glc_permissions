# ═══════════════════════════════════════════════════
# Party Mode (v1.0.0)
# ═══════════════════════════════════════════════════
execute as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.1 50
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
execute as @a at @s run summon minecraft:firework_rocket ~ ~1 ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:4b,colors:[I;11743532,16711680,16755200],trail:1b,twinkle:1b}],flight_duration:1b}}},ShotAtAngle:1b}
tellraw @a ["",{"text":"🎉 PARTİ MODU AKTİF! 🎉","color":"gold","bold":true}]
