# ═══════════════════════════════════════════════════
# Not Permission Dialog
# SYNTAX FIX: Önceki versiyonda "$execute as $(NAME)[tag=lang] run return 0"
# yanlış bir erken çıkışa neden oluyordu — oyuncu dil tag'ine SAHİPSE
# fonksiyonu sonlandırıyor, dialogu göstermiyor, devam etmiyordu.
# Doğru pattern: if entity ile guard → dialog show → return 0
# ═══════════════════════════════════════════════════

# Tag temizle
tag @s remove closed.glc
tag @s remove glc.show_pending

# Turkish
$execute if entity $(NAME)[tag=glc.lang_tr] run dialog show $(NAME)[tag=glc.lang_tr] {type:"minecraft:notice",title:'',body:{type:"minecraft:plain_message",contents:{text:"Yetkiniz Yok!",bold:true,italic:0b,color:"red"}},can_close_with_escape:0b,pause:0b,after_action:'none',action:{label:"Kapat",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}
$execute if entity $(NAME)[tag=glc.lang_tr] run return 0

# English
$execute if entity $(NAME)[tag=glc.lang_en] run dialog show $(NAME)[tag=glc.lang_en] {type:"minecraft:notice",title:'',body:{type:"minecraft:plain_message",contents:{text:"No Permission!",bold:true,italic:0b,color:"red"}},can_close_with_escape:0b,pause:0b,after_action:'none',action:{label:"Close",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}
$execute if entity $(NAME)[tag=glc.lang_en] run return 0

# Default fallback (Turkish)
$dialog show $(NAME) {type:"minecraft:notice",title:'',body:{type:"minecraft:plain_message",contents:{text:"Yetkiniz Yok!",bold:true,italic:0b,color:"red"}},can_close_with_escape:0b,pause:0b,after_action:'none',action:{label:"Kapat",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}
