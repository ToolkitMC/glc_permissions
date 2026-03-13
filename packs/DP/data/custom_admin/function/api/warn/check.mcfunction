# ═══════════════════════════════════════════════════
# Warn: Check (v1.0.0)
# Usage: /function custom_admin:api/warn/check
#        {player:"Ahmet"}
# Permission Level: MOD+
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

# Strike sayısı
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'📋 Uyarı bilgisi: ',color:'aqua'},{text:'$(player)',color:'yellow'}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'  🔢 Aktif uyarı: ',color:'gray'},{score:{name:'$(player)',objective:'glc.strikes'},color:'red',bold:true}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'📋 Warning info: ',color:'aqua'},{text:'$(player)',color:'yellow'}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:'  🔢 Active warnings: ',color:'gray'},{score:{name:'$(player)',objective:'glc.strikes'},color:'red',bold:true}]

# Ban durumu
$execute if entity @a[name=$(player),tag=glc.banned] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'  🚫 Banlı: ',color:'gray'},{text:'EVET',color:'red',bold:true}]
$execute unless entity @a[name=$(player),tag=glc.banned] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'  🚫 Banlı: ',color:'gray'},{text:'Hayır',color:'green'}]
$execute if entity @a[name=$(player),tag=glc.banned] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'  🚫 Banned: ',color:'gray'},{text:'YES',color:'red',bold:true}]
$execute unless entity @a[name=$(player),tag=glc.banned] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'  🚫 Banned: ',color:'gray'},{text:'No',color:'green'}]

# Eşik hatırlatma
tellraw @s[tag=glc.lang_tr] [{text:'  ⚡ Eşikler: ',color:'dark_gray'},{text:'3 uyarı=kick, 5+ uyarı=ban',color:'dark_gray'}]
tellraw @s[tag=glc.lang_en] [{text:'  ⚡ Thresholds: ',color:'dark_gray'},{text:'3 warns=kick, 5+ warns=ban',color:'dark_gray'}]
