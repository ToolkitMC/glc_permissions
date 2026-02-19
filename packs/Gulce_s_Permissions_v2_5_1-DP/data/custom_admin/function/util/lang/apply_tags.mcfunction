# ═══════════════════════════════════════════════════
# Player Language Tag Applier (v2.5.7)
# Purpose: Default Turkish if no tag exists
# DE desteği eklendi
# ═══════════════════════════════════════════════════

# Hiç dil tag'i yoksa Türkçe ata
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run tag @s add glc.lang_tr
