# Cooldown kontrolü (v2.1.0 - Configurable & Bilingual)
# Turkish messages
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GLC] ",color:"aqua",bold:true},{text:"Lütfen bekleyin! Cooldown: ",color:"red"},{score:{name:"@s",objective:"gulce_cooldown"},color:"yellow"},{text:" tick",color:"red"}]

# English messages
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"aqua",bold:true},{text:"Please wait! Cooldown: ",color:"red"},{score:{name:"@s",objective:"gulce_cooldown"},color:"yellow"},{text:" ticks",color:"red"}]

# Default (Turkish)
execute if score @s gulce_cooldown matches 1.. unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"aqua",bold:true},{text:"Lütfen bekleyin! Cooldown: ",color:"red"},{score:{name:"@s",objective:"gulce_cooldown"},color:"yellow"},{text:" tick",color:"red"}]

execute if score @s gulce_cooldown matches 1.. run scoreboard players set @s gulce_menu 0
execute if score @s gulce_cooldown matches 1.. run return 0
