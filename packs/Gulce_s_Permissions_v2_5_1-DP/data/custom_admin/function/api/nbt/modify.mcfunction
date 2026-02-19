# ═══════════════════════════════════════════════════
# API: NBT Modify (v2.5.7)
# Usage: /function custom_admin:api/nbt/modify {file:"ns:path",player:"...",sound:"...",nbt:"...",action:"...",modify_nbt:"..."}
# Permission: OWNER
# NOT: Storage NBT'sini değiştirir, entity NBT'si değil (player data immutable)
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Bu işlem sadece Owner içindir!",color:"red"}]
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Owner only!",color:"red"}]
execute unless entity @s[tag=gulce_owner] run return 0

$function custom_admin:api/nbt/modify_run {file:"$(file)",player:"$(player)",sound:"$(sound)",nbt:"$(nbt)",action:"$(action)",modify_nbt:"$(modify_nbt)"}
