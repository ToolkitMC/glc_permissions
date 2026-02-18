# ═══════════════════════════════════════════════════
# TP Coords (v2.5.1)
# #tp_x, #tp_y, #tp_z scoreboard değerlerini kullanarak
# TP yapar - NBT path üzerinden macro
# ═══════════════════════════════════════════════════
# Scoreboard değerlerini temp entity NBT'ye kopyala
execute store result storage glc:temp tp.x int 1 run scoreboard players get #tp_x glc.timer
execute store result storage glc:temp tp.y int 1 run scoreboard players get #tp_y glc.timer
execute store result storage glc:temp tp.z int 1 run scoreboard players get #tp_z glc.timer
# Macro ile storage'dan oku ve TP yap
function custom_admin:features/vip/tp_macro_exec
