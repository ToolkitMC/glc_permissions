# ═══════════════════════════════════════════════════
# Dialog Open - Storage Hazırlayıcı
# ═══════════════════════════════════════════════════

function glc_menu:handler/dialog/show

# Dialog JSON'ı temp'e kopyala
data modify storage glc:ui temp.final_ui set from storage glc:ui ui

# Tag kaldır (show için hazır)
tag @a remove closed.glc

# Log
execute if entity @s[tag=glc.lang_tr,tag=gulce_debug] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog hazırlandı",color:"gray"}]
execute if entity @s[tag=glc.lang_en,tag=gulce_debug] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog prepared",color:"gray"}]
