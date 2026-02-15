# ═══════════════════════════════════════════════════
# Storage: Initialize Config
# Purpose: Create default configuration
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Default settings
data modify storage glc:config settings set value {\
  cooldown_ticks: 20,\
  max_permissions: 1000,\
  max_groups: 100,\
  max_actions: 500,\
  enable_debug: 0b,\
  auto_save: 1b,\
  log_actions: 1b,\
  rate_limit: 20\
}

# Notify admin
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"📝 Config created with default values","color":"gray"}]
