# ═══════════════════════════════════════════════════
# API: List Actions
# Usage: /function custom_admin:api/action/list
# Tüm eylemleri listeler (id, tip, hedef, durum)
# ═══════════════════════════════════════════════════

# Admin kontrolü
execute unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Yetkisiz erişim!",color:"red"}]
execute unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Unauthorized!",color:"red"}]
execute unless entity @s[tag=gulce_admin] run return 0

# Başlık
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"══════ ⚡ EYLEMLER ══════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"══════ ⚡ ACTIONS ══════",color:"gold",bold:true}]

# Eylem var mı kontrol
execute unless data storage glc:data actions[0] if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"  (Kayıtlı eylem yok)",color:"gray","italic":true}]
execute unless data storage glc:data actions[0] if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"  (No actions registered)",color:"gray","italic":true}]
execute unless data storage glc:data actions[0] run return 0

# Geçici listeye kopyala
data modify storage glc:temp action_list.items set from storage glc:data actions
execute if data storage glc:temp action_list.items[0] run function custom_admin:handler/action/list_loop

# Toplam
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"Toplam: ",color:"gray"},{score:{name:'#action_count',objective:'gulce_id'},color:"aqua"},{text:" eylem",color:"gray"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"Total: ",color:"gray"},{score:{name:'#action_count',objective:'gulce_id'},color:"aqua"},{text:" actions",color:"gray"}]

# Temizlik
data remove storage glc:temp action_list
