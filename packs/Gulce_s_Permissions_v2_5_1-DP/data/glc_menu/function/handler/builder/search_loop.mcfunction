# ═══════════════════════════════════════════════════
# İzin Arama Loop - Filtrelenmiş (MACRO destekli)
# ═══════════════════════════════════════════════════
# build_loop'un arama versiyonu.
# Filtre mantığı: id, permission veya player alanlarından herhangi biri
# search_query ile exact match uygulanır.

# 1. Mevcut indeksi storage'a kaydet
execute store result storage glc:ui temp.current_index int 1 run scoreboard players get #perm_index gulce_id

# 2. Veriyi çek
function glc_menu:handler/builder/get_permission with storage glc:ui temp

# 3. search_query'yi current_perm'e inject et
#    → search_check'in with storage glc:ui temp.current_perm çağrısında $(search_query) erişilebilir olsun
data modify storage glc:ui temp.current_perm.search_query set from storage glc:ui temp.search_query

# 4. Filtre kontrolü ve koşullu buton ekleme
function glc_menu:handler/builder/search_check with storage glc:ui temp.current_perm

# 5. İndeksi artır
scoreboard players add #perm_index gulce_id 1

# 6. Temizlik
data remove storage glc:ui temp.current_perm

# 7. Döngü kontrolü
execute if score #perm_index gulce_id < #perm_count gulce_id run function glc_menu:handler/builder/search_loop
