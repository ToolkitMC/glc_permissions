# ═══════════════════════════════════════════════════
# Welcome Message (v1.0.0)
# Yeni giren oyuncuya karşılama mesajı gönderir
# ═══════════════════════════════════════════════════
execute unless data storage glc:config welcome.enabled run return 0
execute if data storage glc:config welcome.enabled[{value:"false"}] run return 0
tellraw @s [{text:'✦ ',color:'gold'},{nbt:'welcome.message',storage:'glc:config',color:'yellow'},{text:' ✦',color:'gold'}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.2
return 0
