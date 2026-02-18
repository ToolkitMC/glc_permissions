# Varsa eski action'ı sil (upsert - güncelleme veya ekleme)
$data remove storage glc:data actions[{id:"$(id)"}]

# Yeni action'ı ekle
$data modify storage glc:data actions append value {id:"$(id)",type:"$(type)",params:$(args),player:"$(name)"}

# Sayacı güncelle
execute store result score #action_count gulce_id if data storage glc:data actions[]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 4 0
