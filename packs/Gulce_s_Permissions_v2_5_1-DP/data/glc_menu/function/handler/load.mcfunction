# ═══════════════════════════════════════════════════
# GLC Menu - Load Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Forceload (player head selector için)
forceload add 0 0

# Scoreboard
scoreboard objectives add gulce_load.dialog dummy "Dialog Loading"

# Storage başlat
execute unless data storage glc:ui ui run data modify storage glc:ui ui set value {}
execute unless data storage glc:ui temp run data modify storage glc:ui temp set value {}
execute unless data storage glc_menu:names temp run data modify storage glc_menu:names temp set value {}

# Tüm tag'leri temizle
tag @a remove glc.show_pending
tag @a remove closed.glc
tag @a remove glc.close_dialog

# Tüm skorları sıfırla
scoreboard players set @a gulce_load.dialog -1

# Trigger aktifleştir
scoreboard players enable @a gulce_menu

# Başlangıç mesajı
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dinamik menü sistemi yüklendi",color:"gray"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dinamik menü sistemi yüklendi",color:"gray"}]
