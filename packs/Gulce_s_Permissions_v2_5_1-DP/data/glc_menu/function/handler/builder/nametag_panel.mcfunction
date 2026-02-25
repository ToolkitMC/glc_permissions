# ═══════════════════════════════════════════════════
# Menü 21: NameTag Hızlı Giriş Paneli
# Örs + NameTag yöntemi ile popup-free komutlar
# ═══════════════════════════════════════════════════

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TÜRKÇE ───────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📛 NameTag Hızlı Giriş",color:"aqua",bold:true}],body:{type:"minecraft:plain_message",contents:"§l§9Nasıl Çalışır?\n\n§r§71. §fHedef oyuncunun adını\n   §feşyaya §aziyalog §fya §börs §ften yaz\n2. §fAşağıdaki butona bas\n3. §aSunucu eşya adını okur\n4. §cHiç popup çıkmaz!\n\n§8Desteklenen komutlar:\n§8⚠ Uyar  §8🔍 Sorgula  §8✅ Affet\n§8👮 Freeze  §8💔 Öldür\n\n§e💡 İpucu: §7Örs'te yeniden adlandır\n§7ya da §6custom_name §7bileşenini kullan"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠️ NameTag: Uyar",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 1"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔍 NameTag: Sorgula",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 2"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"✅ NameTag: Affet",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 3"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❄️ NameTag: Dondur",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 4"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"💔 NameTag: Öldür",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 5"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❤️ NameTag: İyileştir",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 6"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠️ Uyarı Yönetimi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── İNGİLİZCE ────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📛 NameTag Quick Input",color:"aqua",bold:true}],body:{type:"minecraft:plain_message",contents:"§l§9How It Works?\n\n§r§71. §fType target player's name\n   §fin item name §a(Anvil)\n2. §fClick a button below\n3. §aServer reads item name\n4. §cNo popup ever!\n\n§8Supported commands:\n§8⚠ Warn  §8🔍 Check  §8✅ Pardon\n§8👮 Freeze  §8💔 Kill\n\n§e💡 Tip: §7Rename via Anvil\n§7or use §6custom_name §7component"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠️ NameTag: Warn",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 1"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔍 NameTag: Check",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 2"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✅ NameTag: Pardon",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 3"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❄️ NameTag: Freeze",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 4"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"💔 NameTag: Kill",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 5"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❤️ NameTag: Heal",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 6"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠️ Warning Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}
