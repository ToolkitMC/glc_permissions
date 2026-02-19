# ═══════════════════════════════════════════════════
# API: Run Command (v2.5.7)
# Usage: /function custom_admin:api/run_command {cmd:"komut",selector:"OyuncuAdi",sound:"..."}
# Permission: ADMIN+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Admin+ gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

$function custom_admin:api/run_command_exec {cmd:"$(cmd)",selector:"$(selector)",sound:"$(sound)"}
