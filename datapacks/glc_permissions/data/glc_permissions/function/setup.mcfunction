# Scoreboard'ları oluştur
scoreboard objectives add glc.loop dummy
scoreboard objectives add gulce.used minecraft.used:minecraft.carrot_on_a_stick

# Loop konfigürasyonunu storage'a kaydet
data modify storage glc:loops config set value [\
  {name:"main", value:6},\
  {name:"glc", value:9}\
]

# Loop değerlerini yükle
function main:loop/manage/internal_load

# Diğer sistemleri yükle
function custom_admin:handler/load/1
function glc_menu:handler/load

tellraw @a [{"text":"[Gulce's Permissions] ","color":"gold","bold":true},{"text":"Sistem yüklendi!","color":"green"}]