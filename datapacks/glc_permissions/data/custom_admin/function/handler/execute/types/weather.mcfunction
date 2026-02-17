# ═══════════════════════════════════════════════════
# Weather Action - Hava durumu değiştirir
# params: {weather:"clear|rain|thunder", duration:6000}
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.weather set from storage glc:temp temp.params.weather
data modify storage glc:temp temp.duration set from storage glc:temp temp.params.duration
execute unless data storage glc:temp temp.duration run data modify storage glc:temp temp.duration set value 6000

data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player
execute unless data storage glc:temp temp.selector run data modify storage glc:temp temp.selector set value "@s"
function custom_admin:handler/execute/types/weather_run with storage glc:temp temp
