# ═══════════════════════════════════════════════════
# NameTag Input: Pardon (POPUP-FREE)
# gulce_nametag set 3 ile tetiklenir
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"🚫 MOD yetkisi gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return 0

function custom_admin:features/input/nametag_read
execute unless data storage glc:temp input.nametag run return 0

function custom_admin:features/input/nametag_kill_exec with storage glc:temp input
