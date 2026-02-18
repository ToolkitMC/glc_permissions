# ═══════════════════════════════════════════════════
# Execute: Custom Action (v2.4.0)
# type:'custom' eylemleri için çalıştırıcı
# params: {function:"namespace:path", args:{...}}
# ═══════════════════════════════════════════════════

# Fonksiyon adını temp'e kopyala
data modify storage glc:temp temp.custom_fn set from storage glc:temp temp.params.function

# Args yoksa boş compound ata
execute unless data storage glc:temp temp.params.args run data modify storage glc:temp temp.params.args set value {}

# Args'ı flattened temp storage'a kopyala (macro için)
data modify storage glc:temp temp.custom_args set from storage glc:temp temp.params.args

# Player seçiciyi de geçir
data modify storage glc:temp temp.custom_player set from storage glc:temp temp.exec_action.player

# Macro ile çalıştır
function custom_admin:handler/execute/types/custom_run with storage glc:temp temp
