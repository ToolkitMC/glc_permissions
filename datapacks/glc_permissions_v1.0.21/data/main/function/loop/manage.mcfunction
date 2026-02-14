# ==========================================
# Loop Yönetim Sistemi
# ==========================================

# ============ MACRO FONKSİYONLARI ============

# set_value - Loop değerini ayarla
# Kullanım: function main:loop/manage {action:"set", name:"main", value:20}
$execute if data storage glc:temp {action:"set"} run scoreboard players set #$(name) glc.loop $(value)

# get_value - Loop değerini al
# Kullanım: function main:loop/manage {action:"get", name:"main"}
$execute if data storage glc:temp {action:"get"} run scoreboard players get #$(name) glc.loop

# load_all - Tüm loop'ları storage'dan yükle
# Kullanım: function main:loop/manage {action:"load_all"}
execute if data storage glc:temp {action:"load_all"} run function main:loop/manage/internal_load

# ============ İÇ FONKSİYONLAR ============
# (Bu fonksiyonları direkt çağırma)