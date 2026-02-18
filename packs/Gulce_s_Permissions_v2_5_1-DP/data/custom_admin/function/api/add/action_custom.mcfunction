# ═══════════════════════════════════════════════════
# Action API: Add Custom (v2.4.0)
# Usage: /function custom_admin:api/add/action_custom
#        {id:"myaction", function:"ns:path", args:{key:"val"}, player:"@s"}
# Belirtilen fonksiyonu args ile macro olarak çağırır
# ═══════════════════════════════════════════════════

# Yetki kontrolü (MOD+)
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run function custom_admin:handler/security/permission_denied {action:"add_custom_action",required:"MOD"}
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return 0

# ID kontrolü
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

# Eylem ekle: type='custom', function ve args ile
$data modify storage glc:data actions append value {id:"$(id)",type:"custom",enabled:1b,params:{function:"$(function)",args:$(args)},player:"$(player)"}

# Başarı mesajı
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Özel eylem eklendi: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" → ",color:"gray"},{text:"$(function)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Custom action added: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" → ",color:"gray"},{text:"$(function)",color:"aqua"}]
$tellraw @a[tag=gulce_owner] [{text:"[GULCE] ",color:"gold"},{text:"Özel eylem: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" eklendi.",color:"gray"}]
