# ═══════════════════════════════════════════════════
# Vote: Start Vote (v2.5.7)
# Usage: /function custom_admin:api/vote/start {question_tr:"TR soru",question_en:"EN soru",question_de:"DE soru",duration:2400}
# Permission: ADMIN+
# duration: tick (2400 = 2 dakika)
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[OY] ",color:"red"},{text:"🚫 Admin+ gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

# Zaten aktif oylama var mı?
execute if data storage glc:vote active run tellraw @s [{text:"[OY] ",color:"red"},{text:"⚠ Zaten aktif bir oylama var!",color:"yellow"}]
execute if data storage glc:vote active run return 0

# Oylama başlat
$data modify storage glc:vote active.question_tr set value "$(question_tr)"
$data modify storage glc:vote active.question_en set value "$(question_en)"
$data modify storage glc:vote active.question_de set value "$(question_de)"
$data modify storage glc:vote active.duration set value $(duration)
data modify storage glc:vote active.yes set value 0
data modify storage glc:vote active.no set value 0
execute store result storage glc:vote active.started_at int 1 run time query gametime

# Tüm oyunculara duyur - TR
$tellraw @a[tag=glc.lang_tr] ['',{text:"[📊 OYLAMA] ",color:"gold",bold:true},{text:"$(question_tr)",color:"white"}]
tellraw @a[tag=glc.lang_tr] ['',{text:"  "},{text:"[✅ EVET]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 1"}},{text:"  "},{text:"[❌ HAYIR]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 2"}}]

# EN
$tellraw @a[tag=glc.lang_en] ['',{text:"[📊 VOTE] ",color:"gold",bold:true},{text:"$(question_en)",color:"white"}]
tellraw @a[tag=glc.lang_en] ['',{text:"  "},{text:"[✅ YES]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 1"}},{text:"  "},{text:"[❌ NO]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 2"}}]

# DE
$tellraw @a[tag=glc.lang_de] ['',{text:"[📊 ABSTIMMUNG] ",color:"gold",bold:true},{text:"$(question_de)",color:"white"}]
tellraw @a[tag=glc.lang_de] ['',{text:"  "},{text:"[✅ JA]",color:"green",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 1"}},{text:"  "},{text:"[❌ NEIN]",color:"red",bold:true,click_event:{action:"run_command",command:"/trigger glc.vote set 2"}}]

# Timer başlat
execute store result score #vote_timer glc.timer run data get storage glc:vote active.duration

execute as @a[tag=gulce_admin] at @s run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
