# ═══════════════════════════════════════════════════
# Report: List (v2.5.7)
# Usage: /function custom_admin:api/report/list
# Permission: MOD+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════ RAPORLAR ═══════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════ REPORTS ═══════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"═══════ MELDUNGEN ═══════",color:"gold",bold:true}]

execute unless data storage glc:data reports[0] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  Rapor bulunamadı.",color:"gray"}]
execute unless data storage glc:data reports[0] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  No reports found.",color:"gray"}]
execute unless data storage glc:data reports[0] if entity @s[tag=glc.lang_de] run tellraw @s [{text:"  Keine Meldungen.",color:"gray"}]

tellraw @s [{text:"  ",color:"dark_gray"},{nbt:"reports",storage:"glc:data",interpret:false}]
