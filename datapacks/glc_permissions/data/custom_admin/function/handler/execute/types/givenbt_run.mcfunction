$give $(selector) $(item)$(nbt) $(count)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"🎁 ",color:"green"},{text:"Eşya verildi (NBT): ",color:"gray"},{text:"$(item) x$(count)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s [{text:"🎁 ",color:"green"},{text:"Item given (NBT): ",color:"gray"},{text:"$(item) x$(count)",color:"yellow"}]
