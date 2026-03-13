# ═══════════════════════════════════════════════════
# TPA: Resolve (v2.5.8)
# glc.tpa trigger'ından çağrılır — @s = hedef
# 1 = kabul, 2 = reddet
# ═══════════════════════════════════════════════════

# Skoru geçici yere kopyala
scoreboard players operation #glc.tpa_val glc.timer = @s glc.tpa

# Trigger'ı hemen sıfırla - donmayı önle
scoreboard players set @s glc.tpa 0
scoreboard players enable @s glc.tpa

# @s'in adını al, kendi isteğini bul
function glc_menu:handler/utils/player_name
data modify storage glc:temp tpa_resolve.self set from storage glc_menu:names temp.NAME
function custom_admin:api/tpa/resolve_check with storage glc:temp tpa_resolve
data remove storage glc:temp tpa_resolve

scoreboard players reset #glc.tpa_val glc.timer
