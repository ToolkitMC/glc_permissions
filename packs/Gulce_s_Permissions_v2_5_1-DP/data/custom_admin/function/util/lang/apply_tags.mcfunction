# ═══════════════════════════════════════════════════
# Player Language Tag Applier
# Purpose: Default Turkish if no tag exists
# ═══════════════════════════════════════════════════

# If player has no language tag at all, give them Turkish
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tag @s add glc.lang_tr
