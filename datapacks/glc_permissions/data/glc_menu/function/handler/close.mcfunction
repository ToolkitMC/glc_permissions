# ═══════════════════════════════════════════════════
# Dialog Kapat
# ═══════════════════════════════════════════════════

dialog clear @s

# Skorları sıfırla
scoreboard players set @s gulce_load.dialog -1

# Tag'leri temizle
tag @s remove glc.show_pending
tag @s remove closed.glc
tag @s add glc.close_dialog

# Log

execute if entity @s[tag=glc.lang_tr,tag=gulce_debug] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog kapatıldı",color:"gray"}]
execute if entity @s[tag=glc.lang_en,tag=gulce_debug] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog closed",color:"gray"}]
