# ═══════════════════════════════════════════════════════════════════
# GLC Dispatcher — role_assign_run.mcfunction  (MACRO)
# Çağrı: function ...role_assign_run with storage glc:dispatch flat
# Flat key'ler: $(target), $(role)
# 1.21.8 FIX: Noktalı MACRO syntax'ı yok, flat key'ler kullanılır.
# ═══════════════════════════════════════════════════════════════════

$execute if data storage glc:dispatch {flat:{role:"admin"}} run function custom_admin:role/assign_admin  {player:"$(target)"}
$execute if data storage glc:dispatch {flat:{role:"mod"}} run function custom_admin:role/assign_mod    {player:"$(target)"}
$execute if data storage glc:dispatch {flat:{role:"vip"}} run function custom_admin:role/assign_vip    {player:"$(target)"}
$execute if data storage glc:dispatch {flat:{role:"player"}} run function custom_admin:role/assign_player {player:"$(target)"}
$execute if data storage glc:dispatch {flat:{role:"owner"}} run function custom_admin:role/assign_owner  {player:"$(target)"}
