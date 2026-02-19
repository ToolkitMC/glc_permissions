# ═══════════════════════════════════════════════════
# Home: Set Write (macro)
# Macro: {player:"...", name:"...", x:0.0, y:0.0, z:0.0}
# Storage'a koordinatları yazar
# ═══════════════════════════════════════════════════

$data modify storage glc:homes $(player).$(name) set value {x:$(x),y:$(y),z:$(z)}
