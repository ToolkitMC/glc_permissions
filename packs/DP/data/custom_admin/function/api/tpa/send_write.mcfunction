# ═══════════════════════════════════════════════════
# TPA: Send Write (macro)
# Macro: {from:"...", to:"..."}
# Hedef-bazlı storage + bildirim
# ═══════════════════════════════════════════════════

# Storage: glc:tpa requests.{to} = {from:"...", sent_at:0}
$data modify storage glc:tpa requests.$(to).from set value "$(from)"
$execute store result storage glc:tpa requests.$(to).sent_at int 1 run time query gametime

# Hedefe bildirim - tıklanabilir butonlar
$execute as @a[name=$(to),tag=glc.lang_tr] run tellraw @s ['',{text:"[TPA] ",color:"aqua",bold:true},{text:"$(from)",color:"yellow",bold:true},{text:" sana ışınlanma isteği gönderdi!",color:"white"},{text:"  [KABUL]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 1"}},{text:"  [RED]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 2"}}]
$execute as @a[name=$(to),tag=glc.lang_en] run tellraw @s ['',{text:"[TPA] ",color:"aqua",bold:true},{text:"$(from)",color:"yellow",bold:true},{text:" sent you a teleport request!",color:"white"},{text:"  [ACCEPT]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 1"}},{text:"  [DENY]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 2"}}]
$execute as @a[name=$(to),tag=glc.lang_de] run tellraw @s ['',{text:"[TPA] ",color:"aqua",bold:true},{text:"$(from)",color:"yellow",bold:true},{text:" hat dir eine Teleportanfrage gesendet!",color:"white"},{text:"  [ANNEHMEN]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 1"}},{text:"  [ABLEHNEN]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.tpa set 2"}}]
$execute as @a[name=$(to)] at @s run playsound custom_admin:player.tpa_sent master @s ~ ~ ~ 1 1

# Gönderene bildirim
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"green"},{text:"✅ İstek gönderildi: ",color:"gray"},{text:"$(to)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"green"},{text:"✅ Request sent to: ",color:"gray"},{text:"$(to)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"green"},{text:"✅ Anfrage gesendet an: ",color:"gray"},{text:"$(to)",color:"yellow"}]
