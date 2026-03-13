# ═══════════════════════════════════════════════════
# Action: Home Run (macro)
# Macro: {selector:"OyuncuAdi", home_name:"isim"}
# ═══════════════════════════════════════════════════

$execute as @a[name=$(selector),limit=1] run function custom_admin:api/home/go {name:"$(home_name)"}
