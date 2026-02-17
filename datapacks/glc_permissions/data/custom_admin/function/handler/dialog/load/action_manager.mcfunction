# ═══════════════════════════════════════════════════
# Action Manager Dialog - Eylem Yöneticisi (trigger 5)
# ═══════════════════════════════════════════════════

# Action listesini say
execute store result score #action_count gulce_id if data storage glc:data actions[]

# TR: Action Manager Dialog
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s if entity @s[tag=glc.lang_tr] run dialog show @s {"type":"minecraft:multi_action","title":{"text":"⚡ Eylem Yöneticisi","color":"gold","bold":true,"italic":false},"body":{"type":"minecraft:plain_message","contents":"Kayıtlı eylemleri buradan yönetebilirsin.\n\nEylem eklemek için komutları kullan:\n/function custom_admin:api/add/action_command"},"can_close_with_escape":1b,"pause":0b,"actions":[{"label":"◀️ Ana Panel","action":{"type":"minecraft:run_command","command":"/trigger gulce_trigger set 1"}},{"label":"❓ Yardım","action":{"type":"minecraft:run_command","command":"/trigger gulce_trigger set 3"}}]}

# EN: Action Manager Dialog  
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s if entity @s[tag=glc.lang_en] run dialog show @s {"type":"minecraft:multi_action","title":{"text":"⚡ Action Manager","color":"gold","bold":true,"italic":false},"body":{"type":"minecraft:plain_message","contents":"Manage your registered actions here.\n\nTo add actions, use commands:\n/function custom_admin:api/add/action_command"},"can_close_with_escape":1b,"pause":0b,"actions":[{"label":"◀️ Main Panel","action":{"type":"minecraft:run_command","command":"/trigger gulce_trigger set 1"}},{"label":"❓ Help","action":{"type":"minecraft:run_command","command":"/trigger gulce_trigger set 3"}}]}

# Fallback (dil tag'i yoksa)
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run dialog show @s {"type":"minecraft:multi_action","title":{"text":"⚡ Eylem Yöneticisi / Action Manager","color":"gold","bold":true,"italic":false},"body":{"type":"minecraft:plain_message","contents":"Eylem yöneticisi / Action manager."},"can_close_with_escape":1b,"pause":0b,"actions":[{"label":"◀️ Geri / Back","action":{"type":"minecraft:run_command","command":"/trigger gulce_trigger set 1"}}]}
