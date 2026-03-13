# ═══════════════════════════════════════════════════
# API: List Permissions
# Usage: /function custom_admin:api/permission/list
# Tüm izinleri döngüyle listeler
# ═══════════════════════════════════════════════════

# Admin kontrolü
execute unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Yetkisiz erişim!",color:"red"}]
execute unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Unauthorized!",color:"red"}]
execute unless entity @s[tag=gulce_admin] run return 0

# Başlık
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"══════ 🔐 İZİNLER ══════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"══════ 🔐 PERMISSIONS ══════",color:"gold",bold:true}]

# İzin var mı kontrol
execute unless data storage glc:data permissions[0] if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"  (Kayıtlı izin yok)",color:"gray","italic":true}]
execute unless data storage glc:data permissions[0] if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"  (No permissions registered)",color:"gray","italic":true}]
execute unless data storage glc:data permissions[0] run return 0

# Geçici listeye kopyala ve döngüye gir
data modify storage glc:temp perm_list.items set from storage glc:data permissions
data modify storage glc:temp perm_list.caller set value "@s"
execute if data storage glc:temp perm_list.items[0] run function custom_admin:handler/permission/list_loop

# Toplam
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"Toplam: ",color:"gray"},{score:{name:'#perm_count',objective:'gulce_id'},color:"green"},{text:" izin",color:"gray"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"Total: ",color:"gray"},{score:{name:'#perm_count',objective:'gulce_id'},color:"green"},{text:" permissions",color:"gray"}]

# Temizlik
data remove storage glc:temp perm_list
