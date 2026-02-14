# Storage'daki loop değerlerini yükle
execute if data storage glc:loops config[{name:"main"}] store result score #main glc.loop run data get storage glc:loops config[{name:"main"}].value
execute if data storage glc:loops config[{name:"glc"}] store result score #glc glc.loop run data get storage glc:loops config[{name:"glc"}].value

tellraw @a [{"text":"[Loop] ","color":"green","bold":true},{"text":"Değerler yüklendi!","color":"yellow"}]
