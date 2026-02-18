# ═══════════════════════════════════════════════════
# Auto Announce System (v1.0.0)
# glc:config auto_announcements listesindeki mesajları
# belirli aralıklarla tüm oyunculara gönderir
# Her çağrıda bir sonraki mesaja geçer (döngüsel)
# ═══════════════════════════════════════════════════

# Aktif mi?
execute unless data storage glc:config auto_announce.enabled run return 0
execute if data storage glc:config auto_announce.enabled[{value:0b}] run return 0

# Mesaj listesi boş mu?
execute unless data storage glc:config auto_announce.messages[0] run return 0

# Mevcut index'i al, yoksa 0'dan başla
execute unless data storage glc:config auto_announce.current_index run data modify storage glc:config auto_announce.current_index set value 0

# Mesajı gönder
function custom_admin:handler/automation/announce_send

# Index'i ilerlet
execute store result score #ann_idx glc.timer run data get storage glc:config auto_announce.current_index
scoreboard players add #ann_idx glc.timer 1
execute store result score #ann_max glc.timer run data get storage glc:config auto_announce.messages[] 1
execute if score #ann_idx glc.timer >= #ann_max glc.timer run scoreboard players set #ann_idx glc.timer 0
execute store result storage glc:config auto_announce.current_index int 1 run scoreboard players get #ann_idx glc.timer
