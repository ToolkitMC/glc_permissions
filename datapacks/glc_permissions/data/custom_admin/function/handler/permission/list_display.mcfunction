# ═══════════════════════════════════════════════════
# Permission List Display (MACRO)
# ═══════════════════════════════════════════════════

$tellraw @a[tag=gulce_admin] ['',{text:"  "},{text:"[$(id)]",color:"yellow",click_event:{action:"run_command",command:"say permission:$(id)"}},{text:" 👤 ",color:"gray"},{text:"$(player)",color:"aqua"},{text:" | Lv.",color:"gray"},{text:"$(level)",color:"green"},{text:" | ",color:"dark_gray"},{text:"$(permission)",color:"white"}]
