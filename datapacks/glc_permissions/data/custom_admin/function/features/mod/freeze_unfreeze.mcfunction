# ═══════════════════════════════════════════════════
# Unfreeze (v2.0.2)
# ═══════════════════════════════════════════════════
tag @s remove ca.freezed
execute if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"🔥 Çözüldünüz! Tekrar hareket edebilirsiniz.","color":"green"}
execute if entity @s[tag=glc.lang_en] run tellraw @s {"text":"🔥 You are unfrozen! You can move again.","color":"green"}
