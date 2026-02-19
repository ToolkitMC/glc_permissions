# ═══════════════════════════════════════════════════
# TPA: Deny Notify (macro)
# Macro: {from:"Gönderen", to:"Hedef"}
# ═══════════════════════════════════════════════════

$execute as @a[name=$(from),tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"$(to)",color:"yellow"},{text:" isteğini reddetti.",color:"gray"}]
$execute as @a[name=$(from),tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"$(to)",color:"yellow"},{text:" denied your request.",color:"gray"}]
$execute as @a[name=$(from),tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"$(to)",color:"yellow"},{text:" hat deine Anfrage abgelehnt.",color:"gray"}]
