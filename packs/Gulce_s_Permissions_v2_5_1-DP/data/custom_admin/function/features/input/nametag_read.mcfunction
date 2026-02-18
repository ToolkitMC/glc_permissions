# ═══════════════════════════════════════════════════
# NameTag Input: Read
# Oyuncunun elindeki eşyanın adını storage'a yazar
# Çağıran: nametag_warn / nametag_check / nametag_pardon
# ═══════════════════════════════════════════════════

# Eşya var mı?
execute store success score #nametag_ok glc.timer if data entity @s SelectedItem.components."minecraft:custom_name"
execute if score #nametag_ok glc.timer matches 0 if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Elindeki eşyayı önce örs'te yeniden adlandır!",color:"red"}]
execute if score #nametag_ok glc.timer matches 0 if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Rename your held item at an Anvil first!",color:"red"}]
execute if score #nametag_ok glc.timer matches 0 run return 0

# .text alanını çek (örs adlandırması: {"italic":false,"text":"İsim"})
execute store success score #nametag_has_text glc.timer if data entity @s SelectedItem.components."minecraft:custom_name".text
execute if score #nametag_has_text glc.timer matches 1 run data modify storage glc:temp input.nametag set from entity @s SelectedItem.components."minecraft:custom_name".text

# Fallback: düz string ise direkt oku
execute if score #nametag_has_text glc.timer matches 0 run data modify storage glc:temp input.nametag set from entity @s SelectedItem.components."minecraft:custom_name"

# Başarı mesajı (debug)
execute if entity @s[tag=gulce_debug] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gray"},{text:"NameTag okundu → ",color:"gray"},{nbt:"input.nametag",storage:"glc:temp",color:"yellow"}]
execute if entity @s[tag=gulce_debug] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gray"},{text:"NameTag read → ",color:"gray"},{nbt:"input.nametag",storage:"glc:temp",color:"yellow"}]
