# ═══════════════════════════════════════════════════
# Player Join Handler (v1.0.0)
# Bu oturumda ilk kez algılanan oyunculara çalışır
# (glc.joined tag'i olmayanlar = yeni giren)
# ═══════════════════════════════════════════════════

# Tag ekle - bir daha çalışmasın
tag @s add glc.joined

# Trigger'ları etkinleştir
scoreboard players enable @s gulce_trigger
scoreboard players enable @s gulce_menu

# Permission level sync - yeni oyuncu için
function custom_admin:permissions/sync_levels

# Karşılama mesajı (config'te varsa)
execute if data storage glc:config welcome run function custom_admin:handler/welcome_message

# Dil tag'i yoksa varsayılan uygula
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run function custom_admin:util/lang/apply_tags

# Donmuş oyuncu kontrolü - yeniden giriş yapınca dondurma devam et
execute if entity @s[tag=ca.freezed] run tellraw @s {text:'❄️ Donmuş durumdasınız!',color:'aqua'}

# Debug log
execute as @a[tag=gulce_debug] run tellraw @s [{text:'[GULCE] ',color:'gold'},{text:'👋 Oyuncu girdi: ',color:'gray'},{selector:'@s',color:'yellow'}]

# v2.5.7: Yeni trigger'ları etkinleştir
scoreboard players enable @s glc.tpa
scoreboard players enable @s glc.vote
scoreboard players enable @s glc.confirm
scoreboard players enable @s gulce_nametag

# Giriş sesi
playsound custom_admin:player.join master @s ~ ~ ~ 1 1
