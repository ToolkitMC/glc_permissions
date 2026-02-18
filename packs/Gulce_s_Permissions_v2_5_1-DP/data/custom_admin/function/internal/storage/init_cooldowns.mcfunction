# ═══════════════════════════════════════════════════
# Timer/Cooldown Configuration Init
# Purpose: Initialize customizable cooldown settings
# ═══════════════════════════════════════════════════

# Default cooldown values (in ticks, 20 ticks = 1 second)
data modify storage glc:config cooldowns set value {menu_open:40,action_execute:20,permission_check:5,global_cooldown:60}

# Timer settings
data modify storage glc:config timers set value {enabled:1b,default_interval:20,max_interval:6000}

execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Cooldown/Timer ayarları yüklendi",color:"green"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Cooldown/Timer ayarları yüklendi",color:"green"}]
