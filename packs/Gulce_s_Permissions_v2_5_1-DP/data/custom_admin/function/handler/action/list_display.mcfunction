# ═══════════════════════════════════════════════════
# Action List Display (MACRO)
# enabled:1b = ✅ aktif, enabled:0b = ⛔ pasif
# ═══════════════════════════════════════════════════

# Aktif mi değil mi kontrolü için iki ayrı satır
$execute if data storage glc:data actions[{id:"$(id)",enabled:1b}] run tellraw @a[tag=gulce_admin] ['',{text:"  "},{text:"✅ ",color:"green"},{text:"[$(id)]",color:"yellow"},{text:" 🔷 ",color:"gray"},{text:"$(type)",color:"aqua"},{text:" → ",color:"dark_gray"},{text:"$(player)",color:"white"}]
$execute unless data storage glc:data actions[{id:"$(id)",enabled:1b}] run tellraw @a[tag=gulce_admin] ['',{text:"  "},{text:"⛔ ",color:"red"},{text:"[$(id)]",color:"gray"},{text:" 🔷 ",color:"gray"},{text:"$(type)",color:"dark_aqua"},{text:" → ",color:"dark_gray"},{text:"$(player)",color:"gray"}]
