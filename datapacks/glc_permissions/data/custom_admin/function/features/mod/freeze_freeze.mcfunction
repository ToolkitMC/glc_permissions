# ═══════════════════════════════════════════════════
# Freeze (v2.0.3-fix)
# Tag: ca.freezed — main loop'ta tp @s @s ile kilitlenir
# ═══════════════════════════════════════════════════
tag @s add ca.freezed
execute if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"❄️ Donduruldunuz! Hareket edemezsiniz.","color":"aqua"}
execute if entity @s[tag=glc.lang_en] run tellraw @s {"text":"❄️ You are frozen! You cannot move.","color":"aqua"}
