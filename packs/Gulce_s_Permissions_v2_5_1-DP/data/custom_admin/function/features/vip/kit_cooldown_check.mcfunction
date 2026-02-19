# ═══════════════════════════════════════════════════
# VIP Kit: Cooldown Check (v2.5.7)
# Usage: vip_bundle çağrısından önce çağrılır
# Cooldown: 3600 tick = 3 dakika
# ═══════════════════════════════════════════════════

# Kit cooldown var mı?
execute if score @s glc.kit_cd matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[KIT] ",color:"red",bold:true},{text:"⏳ Kit bekleme süresi: ",color:"yellow"},{score:{name:"@s",objective:"glc.kit_cd"},color:"yellow"},{text:" tick",color:"gray"}]
execute if score @s glc.kit_cd matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[KIT] ",color:"red",bold:true},{text:"⏳ Kit cooldown: ",color:"yellow"},{score:{name:"@s",objective:"glc.kit_cd"},color:"yellow"},{text:" ticks",color:"gray"}]
execute if score @s glc.kit_cd matches 1.. if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[KIT] ",color:"red",bold:true},{text:"⏳ Kit-Wartezeit: ",color:"yellow"},{score:{name:"@s",objective:"glc.kit_cd"},color:"yellow"},{text:" Ticks",color:"gray"}]
execute if score @s glc.kit_cd matches 1.. run return fail

# Cooldown yok - kit ver + cooldown başlat
function custom_admin:features/vip/vip_bundle
scoreboard players set @s glc.kit_cd 3600
return 0
