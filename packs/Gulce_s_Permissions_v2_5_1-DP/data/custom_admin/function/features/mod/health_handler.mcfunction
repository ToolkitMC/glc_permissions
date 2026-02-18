# ═══════════════════════════════════════════════════
# Health Handler (v2.5.1)
# Macro: {player:"<n>", action:"heal|half|kill"}
# ═══════════════════════════════════════════════════
$execute as @a[name="$(player)"] run function custom_admin:features/mod/health_apply {action:"$(action)"}
