# ═══════════════════════════════════════════════════
# GLC Menu - Tick Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Trigger kontrolü
execute as @a[scores={gulce_menu=1..}] run function glc_menu:handler/trigger
execute as @a[scores={gulce_menu=-512}] run function glc_menu:handler/trigger

# Cooldown azalt (v2.0.2)

# Loading skorları azalt
scoreboard players remove @a[scores={gulce_load.dialog=1..}] gulce_load.dialog 1

# Apply language tags to new players (v2.0.2)
execute as @a unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run function custom_admin:util/lang/apply_tags

# Sadece 0'a düştüğünde BİR KEZ göster
execute as @a[scores={gulce_load.dialog=0},tag=glc.show_pending] run function glc_menu:handler/dialog/open

# Tag temizliği
tag @a[tag=closed.glc] remove closed.glc
tag @a[tag=glc.close_dialog] remove glc.close_dialog

# Trigger Etkinleştir
scoreboard players enable @a[tag=gulce_admin] gulce_trigger
scoreboard players enable @a[tag=gulce_admin] gulce_menu


# v2.5.7: Yeni trigger'ları etkinleştir
scoreboard players enable @a glc.tpa
scoreboard players enable @a glc.vote
scoreboard players enable @a[tag=glc.confirm_pending] glc.confirm

# v2.5.7: Yeni item kullanımı
execute as @a[scores={glc.used.tpa=1..}] run function glc_menu:items/panels/tpa_item
execute as @a[scores={glc.used.home=1..}] run function glc_menu:items/panels/home_item
execute as @a[scores={glc.used.vote=1..},tag=gulce_admin] run function glc_menu:items/panels/vote_item
scoreboard players set @a glc.used.tpa 0
scoreboard players set @a glc.used.home 0
scoreboard players set @a glc.used.vote 0
