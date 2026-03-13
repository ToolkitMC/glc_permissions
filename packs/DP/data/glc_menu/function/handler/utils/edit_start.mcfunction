# ═══════════════════════════════════════════════════
# Düzenleme Başlat (MACRO)
# ═══════════════════════════════════════════════════

# ID'yi kaydet
$data modify storage glc:ui temp.edit_id set value "$(id)"

# Düzenleme menüsünü hazırla
$function glc_menu:handler/utils/edit_form/build/main {id:"$(id)"}