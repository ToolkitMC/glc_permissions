# ═══════════════════════════════════════════════════
# Security: Permission Denied
# Usage: function custom_admin:handler/security/permission_denied
#        {action:"fonksiyon_adi", required:"owner/mod/vip"}
# Çağıran: Yetersiz yetki tespit eden her fonksiyon
# ═══════════════════════════════════════════════════

# Oyuncuya hata mesajı - TR
tellraw @s[tag=glc.lang_tr] ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Yetersiz yetki!",color:"red",bold:true}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"  İşlem: ",color:"gray"},{text:"$(action)",color:"yellow"},{text:"  Gerekli: ",color:"gray"},{text:"$(required)",color:"red",bold:true}]

# Oyuncuya hata mesajı - EN
tellraw @s[tag=glc.lang_en] ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Insufficient permission!",color:"red",bold:true}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"  Action: ",color:"gray"},{text:"$(action)",color:"yellow"},{text:"  Required: ",color:"gray"},{text:"$(required)",color:"red",bold:true}]

# Fallback (dil tag'i yoksa TR)
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Yetersiz yetki: $(action)",color:"red"}]

# Ses efekti
playsound custom_admin:ui.error master @s ~ ~ ~ 1 1

# GÜVENLIK: Admin'lere log gönder
$tellraw @a[tag=gulce_owner] ['',{text:"[SECURITY] ",color:"dark_red",bold:true},{selector:"@s",color:"yellow"},{text:" yetkisiz erişim denedi → ",color:"gray"},{text:"$(action)",color:"red"},{text:" [req: ",color:"dark_gray"},{text:"$(required)",color:"red"},{text:"]",color:"dark_gray"}]

# GÜVENLIK: storage'a logla
$data modify storage glc:log security append value {type:"permission_denied",action:"$(action)",required:"$(required)",timestamp:0}
execute store result storage glc:log security[-1].timestamp int 1 run time query gametime

# Log sayacını artır
scoreboard players add #security_violations glc.timer 1

# Debug log
$execute as @a[tag=gulce_debug] run tellraw @s ['',{text:"[SEC] ",color:"dark_red"},{selector:"@s",color:"yellow"},{text:" → $(action)",color:"gray"}]
