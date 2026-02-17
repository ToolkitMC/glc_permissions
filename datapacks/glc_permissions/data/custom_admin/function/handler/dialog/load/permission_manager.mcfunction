# ═══════════════════════════════════════════════════
# Load Permission Manager
# ═══════════════════════════════════════════════════

execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s run trigger gulce_menu

execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"İzin yönetimi yüklendi.",color:"gray"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"İzin yönetimi yüklendi.",color:"gray"}]
