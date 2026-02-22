# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — deny.mcfunction
# Yetkisiz erişim uyarısı (bilingüal)
# ═══════════════════════════════════════════════════════════════════

execute if entity @s[tag=glc.lang_tr] run tellraw @s [\
    {text:"[GULCE] ",color:"dark_red",bold:true},\
    {text:"⛔ Bu rotaya erişim yetkiniz yok!",color:"red"}\
]
execute if entity @s[tag=glc.lang_en] run tellraw @s [\
    {text:"[GULCE] ",color:"dark_red",bold:true},\
    {text:"⛔ You don't have permission for this route!",color:"red"}\
]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [\
    {text:"[GULCE] ",color:"dark_red",bold:true},\
    {text:"⛔ Access denied.",color:"red"}\
]
