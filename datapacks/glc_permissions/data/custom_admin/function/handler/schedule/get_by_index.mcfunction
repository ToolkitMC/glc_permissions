# ═══════════════════════════════════════════════════
# Index'e Göre Zamanlama Al (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:temp temp.current_schedule set from storage glc:data scheduled[$(current_index)]