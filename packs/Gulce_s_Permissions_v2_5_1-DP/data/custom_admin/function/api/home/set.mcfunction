# ═══════════════════════════════════════════════════
# Home: Set (v2.5.7)
# Usage: /function custom_admin:api/home/set {name:"isim"}
# Permission: VIP+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"red",bold:true},{text:"🚫 VIP+ gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[HOME] ",color:"red",bold:true},{text:"🚫 VIP+ required!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[HOME] ",color:"red",bold:true},{text:"🚫 VIP+ erforderlich!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

# Oyuncu adını al
function glc_menu:handler/utils/player_name
data modify storage glc:temp home_set.player set from storage glc_menu:names temp.NAME

# İsmi, koordinatları temp'e kaydet
$data modify storage glc:temp home_set.name set value "$(name)"
# Pos[0..2] * 1.0 = double — store result double doğrudan entity'den
execute store result storage glc:temp home_set.x double 1 run data get entity @s Pos[0]
execute store result storage glc:temp home_set.y double 1 run data get entity @s Pos[1]
execute store result storage glc:temp home_set.z double 1 run data get entity @s Pos[2]

# Storage'a yaz
function custom_admin:api/home/set_write with storage glc:temp home_set

# Başarı mesajı — ev adını storage'dan göster
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"green",bold:true},{text:"✅ Ev kaydedildi: ",color:"green"},{nbt:"home_set.name",storage:"glc:temp",color:"yellow",interpret:false}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[HOME] ",color:"green",bold:true},{text:"✅ Home saved: ",color:"green"},{nbt:"home_set.name",storage:"glc:temp",color:"yellow",interpret:false}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[HOME] ",color:"green",bold:true},{text:"✅ Heimort gespeichert: ",color:"green"},{nbt:"home_set.name",storage:"glc:temp",color:"yellow",interpret:false}]

data remove storage glc:temp home_set
execute at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.5
