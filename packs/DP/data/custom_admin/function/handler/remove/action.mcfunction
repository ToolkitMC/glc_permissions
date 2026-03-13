# ═══════════════════════════════════════════════════
# Remove Action - Eylem siler (MACRO)
# ═══════════════════════════════════════════════════

# Action var mı kontrol et
$execute unless data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Eylem bulunamadı: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Action not found: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

# Sil (set value değil, gerçek remove)
$data remove storage glc:data actions[{id:"$(id)"}]

# Sayacı güncelle
execute store result score #action_count gulce_id if data storage glc:data actions[]

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Eylem silindi: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Action deleted: ",color:"red"},{text:"$(id)",color:"yellow"}]
