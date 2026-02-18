# ═══════════════════════════════════════════════════
# TP Run Macro (v2.5.1)
# glc:temp tp{x,y,z} storage'dan koordinat okur
# ═══════════════════════════════════════════════════
execute store result score #tp_x glc.timer run data get storage glc:temp tp.x
execute store result score #tp_y glc.timer run data get storage glc:temp tp.y
execute store result score #tp_z glc.timer run data get storage glc:temp tp.z
# Koordinatları entity pos olarak yaz ve TP yap
execute positioned 0.0 0.0 0.0 run function custom_admin:features/vip/tp_final
