# ═══════════════════════════════════════════════════
# Tag Loop - DÜZELTME v1.2.1
# DÜZELTME: Return 0 uyumluluk
# ═══════════════════════════════════════════════════

# Limit kontrolü - tick başına max 3 grup
execute if score #group_tick_counter gulce_id matches ..2 run function custom_admin:handler/group/apply_tags_loop_process