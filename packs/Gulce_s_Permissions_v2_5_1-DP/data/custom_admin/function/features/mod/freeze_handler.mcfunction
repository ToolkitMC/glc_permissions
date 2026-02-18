# ═══════════════════════════════════════════════════
# Freeze Handler (v1.0.0)
# Macro: {player:"<name>", action:"freeze|unfreeze"}
# ═══════════════════════════════════════════════════
$execute as @a[name="$(player)"] run function custom_admin:features/mod/freeze_apply {action:"$(action)"}
