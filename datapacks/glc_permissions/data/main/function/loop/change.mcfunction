# Runtime'da loop değerini değiştir
# Kullanım: /function main:loop/change {name:"main", value:40}

$scoreboard players set #$(name) glc.loop $(value)
$tellraw @s [{"text":"[Loop] ","color":"aqua","bold":true},{"text":"#$(name)","color":"yellow"},{"text":" = ","color":"white"},{"text":"$(value)","color":"green"},{"text":" tick","color":"gray"}]

