# ═══════════════════════════════════════════════════
# Permission Parser - İzinleri kontrol eder - DÜZELTME v1.2.0
# DÜZELTME: Tellraw spam kaldırıldı
# ═══════════════════════════════════════════════════

# İzin listesini kontrol et
execute store result score #permission_check gulce_id run data get storage glc:data permissions

# İzni olan oyuncuları işaretle
execute as @a if score @s gulce_id = #permission_check gulce_id run tag @s add gulce_permitted

# DÜZELTME v1.2.0: Tellraw spam kaldırıldı
# Log sadece debug modunda gösterilir