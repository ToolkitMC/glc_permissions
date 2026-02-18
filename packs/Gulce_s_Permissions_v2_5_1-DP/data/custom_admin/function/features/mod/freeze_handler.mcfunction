# ═══════════════════════════════════════════════════
# Freeze Handler (v2.5.1)
# Macro: {player:"<name>", action:"freeze|unfreeze"}
# ═══════════════════════════════════════════════════
$execute as @a[name="$(player)"] run function custom_admin:features/mod/freeze_apply {action:"$(action)"}
