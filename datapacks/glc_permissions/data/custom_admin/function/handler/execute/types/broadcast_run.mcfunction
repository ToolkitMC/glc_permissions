# ═══════════════════════════════════════════════════
# Broadcast Run - Macro ile tüm sunucuya mesaj
# Parametreler storage'dan gelir (with storage glc:temp temp)
# ═══════════════════════════════════════════════════

# Prefix varsa önce prefix göster, sonra mesaj
# Hem JSON hem de düz metin desteklenir

# JSON formatı kontrolü: message { ile başlıyorsa JSON tellraw
$tellraw @a [{text:"$(bc_prefix) ",color:"$(bc_color)",bold:true},{text:"$(bc_message)",color:"white"}]
