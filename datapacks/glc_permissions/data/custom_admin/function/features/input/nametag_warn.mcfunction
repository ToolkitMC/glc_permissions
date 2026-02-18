# ═══════════════════════════════════════════════════
# NameTag Input: Warn (POPUP-FREE)
# gulce_nametag set 1 ile tetiklenir
# Elindeki eşyanın adı = hedef oyuncu
# ═══════════════════════════════════════════════════

# Yetki kontrolü (MOD+)
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"🚫 Bu komut için MOD yetkisi gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return 0

# NameTag oku
function custom_admin:features/input/nametag_read
execute unless data storage glc:temp input.nametag run return 0

# Varsayılan sebep al (config'den, yoksa default)
execute unless data storage glc:config warn_default_reason run data modify storage glc:config warn_default_reason set value "Kural İhlali / Rule Violation"

# Yetkili adını storage'a yaz
data modify storage glc:temp input.mod set from entity @s CustomName
execute unless data storage glc:temp input.mod run data modify storage glc:temp input.mod set value "Staff"

# Uyarı ver (macro ile)
function custom_admin:features/input/nametag_warn_exec with storage glc:temp input
