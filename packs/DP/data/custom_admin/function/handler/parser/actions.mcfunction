# ═══════════════════════════════════════════════════
# Action Parser - Eylemleri ayrıştırır
# ═══════════════════════════════════════════════════

# Action listesini işle - handler/execute/action ile çalıştır
execute if data storage glc:temp id run function custom_admin:handler/execute/action with storage glc:temp

# Action'ı işaretle
data modify storage glc:temp temp.action_processed set value 1b

# Feedback
execute if data storage glc:temp temp{feedback:'on'} if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem başarıyla işlendi.",color:"green"}]
execute if data storage glc:temp temp{feedback:'on'} if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Action processed successfully.",color:"green"}]
