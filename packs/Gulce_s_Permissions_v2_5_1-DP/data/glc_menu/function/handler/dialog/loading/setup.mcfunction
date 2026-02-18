
# --- [ 4 EKRAN TÜRÜ ] ---
# Mod 1: Yükleme - TR
execute if score @s glc_load_type matches 1 if entity @s[tag=glc.lang_tr] run data modify storage glc:system loading set value {title:"⌛",body:"\n§fİçerik Yükleniyor...\n§7Lütfen bekleyiniz.\n ",cancel:"✖ İptal",value:"/function glc_menu:handler/close"}
# Mod 1: Loading - EN
execute if score @s glc_load_type matches 1 if entity @s[tag=glc.lang_en] run data modify storage glc:system loading set value {title:"⌛",body:"\n§fLoading Content...\n§7Please wait.\n ",cancel:"✖ Cancel",value:"/function glc_menu:handler/close"}

# Mod 2: Kaydetme - TR
execute if score @s glc_load_type matches 2 if entity @s[tag=glc.lang_tr] run data modify storage glc:system loading set value {title:"💾",body:"\n§eDeğişiklikler İşleniyor...\n§7Veritabanı güncelleniyor.\n ",cancel:"✖ Durdur",value:"/function glc_menu:handler/close"}
# Mod 2: Saving - EN
execute if score @s glc_load_type matches 2 if entity @s[tag=glc.lang_en] run data modify storage glc:system loading set value {title:"💾",body:"\n§eProcessing Changes...\n§7Updating database.\n ",cancel:"✖ Stop",value:"/function glc_menu:handler/close"}

# Mod 3: Kritik - TR
execute if score @s glc_load_type matches 3 if entity @s[tag=glc.lang_tr] run data modify storage glc:system loading set value {title:"⚠️",body:"\n§cKritik İşlem Yürütülüyor!\n§4Lütfen pencereyi kapatmayın.\n ",cancel:"🔒 Bekle",value:''}
# Mod 3: Critical - EN
execute if score @s glc_load_type matches 3 if entity @s[tag=glc.lang_en] run data modify storage glc:system loading set value {title:"⚠️",body:"\n§cCritical Operation Running!\n§4Please don't close the window.\n ",cancel:"🔒 Wait",value:''}

# Mod 4: Başarılı - TR
execute if score @s glc_load_type matches 4 if entity @s[tag=glc.lang_tr] run data modify storage glc:system loading set value {title:"✅",body:"\n§aİşlem Tamamlandı!\n§7Tüm veriler senkronize edildi.\n ",cancel:"Anladım",value:"/function glc_menu:handler/close"}
# Mod 4: Success - EN
execute if score @s glc_load_type matches 4 if entity @s[tag=glc.lang_en] run data modify storage glc:system loading set value {title:"✅",body:"\n§aOperation Completed!\n§7All data synchronized.\n ",cancel:"OK",value:"/function glc_menu:handler/close"}


function glc_menu:handler/dialog/loading/render with storage glc:system loading