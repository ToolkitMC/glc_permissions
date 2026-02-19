# ═══════════════════════════════════════════════════
# Vote: Announce Results (v2.5.7)
# ═══════════════════════════════════════════════════

tellraw @a[tag=glc.lang_tr] ['',{text:"[📊 OYLAMA SONUCU] ",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_tr] ['',{text:"  ✅ EVET: ",color:"green"},{score:{name:"#vote_yes",objective:"glc.timer"},color:"green",bold:true},{text:"  ❌ HAYIR: ",color:"red"},{score:{name:"#vote_no",objective:"glc.timer"},color:"red",bold:true}]

tellraw @a[tag=glc.lang_en] ['',{text:"[📊 VOTE RESULT] ",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_en] ['',{text:"  ✅ YES: ",color:"green"},{score:{name:"#vote_yes",objective:"glc.timer"},color:"green",bold:true},{text:"  ❌ NO: ",color:"red"},{score:{name:"#vote_no",objective:"glc.timer"},color:"red",bold:true}]

tellraw @a[tag=glc.lang_de] ['',{text:"[📊 ABSTIMMUNGSERGEBNIS] ",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_de] ['',{text:"  ✅ JA: ",color:"green"},{score:{name:"#vote_yes",objective:"glc.timer"},color:"green",bold:true},{text:"  ❌ NEIN: ",color:"red"},{score:{name:"#vote_no",objective:"glc.timer"},color:"red",bold:true}]

execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
