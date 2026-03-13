# ═══════════════════════════════════════════════════
# Language Setter
# Usage: /function custom_admin:util/lang/set {lang:"tr"}
# Supported: tr, en, de (genişletilebilir)
# ═══════════════════════════════════════════════════

# Mevcut dil tag'lerini kaldır
tag @s remove glc.lang_tr
tag @s remove glc.lang_en
tag @s remove glc.lang_de

# Yeni dil tag'ini ekle (macro-safe, sadece type=player için)
$tag @s[type=player] add glc.lang_$(lang)

# Feedback - TR seçildiyse
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ Dil değiştirildi: ",color:"green"},{text:"Türkçe 🇹🇷",color:"yellow"}]

# Feedback - EN seçildiyse
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Language changed: ",color:"green"},{text:"English 🇬🇧",color:"yellow"}]

# Feedback - DE seçildiyse
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"✅ Sprache geändert: ",color:"green"},{text:"Deutsch 🇩🇪",color:"yellow"}]

# Geçersiz dil kodu girilmişse (hiçbir tag eklenemediyse)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run tag @s add glc.lang_tr
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"⚠ Geçersiz dil kodu, Türkçe'ye döndürüldü.",color:"yellow"}]

# Ses efekti
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

# Menü açıksa yeniden aç
execute if score @s gulce_menu matches 60 run trigger gulce_menu set 60
