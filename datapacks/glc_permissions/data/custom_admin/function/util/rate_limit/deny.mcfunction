# ═══════════════════════════════════════════════════
# Rate Limit: Deny - Cooldown aktifken engelle
# Çağıran: Her aksiyon execute başında
# ═══════════════════════════════════════════════════

# Mesaj - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"red",bold:true},{text:"⏳ Çok hızlı! Cooldown: ",color:"red"},{score:{name:"@s",objective:'gulce_cooldown'},color:"yellow"},{text:" tick kaldı",color:"red"}]

# Mesaj - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"red",bold:true},{text:"⏳ Too fast! Cooldown: ",color:"red"},{score:{name:"@s",objective:'gulce_cooldown'},color:"yellow"},{text:" ticks remaining",color:"red"}]

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"red",bold:true},{text:"⏳ Çok hızlı! Cooldown: ",color:"red"},{score:{name:"@s",objective:'gulce_cooldown'},color:"yellow"},{text:" tick kaldı",color:"red"}]

# Ses efekti
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
