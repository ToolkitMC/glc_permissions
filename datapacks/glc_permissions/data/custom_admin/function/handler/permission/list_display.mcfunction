# ═══════════════════════════════════════════════════
# Permission List Display (MACRO)
# ═══════════════════════════════════════════════════

$tellraw @a[tag=gulce_admin] ['',{text:"  "},{text:"[$(id)]",color:"yellow",clickEvent:{action:"run_command",value:"/say permission:$(id)"}},{text:" 👤 ",color:"gray"},{text:"$(player)",color:"aqua"},{text:" | Lv.",color:"gray"},{text:"$(level)",color:"green"},{text:" | ",color:"dark_gray"},{text:"$(permission)",color:"white"}]
