# ═══════════════════════════════════════════════════════════════════
# GLC Action Dispatcher — main.mcfunction
# Namespace : custom_admin
# Storage   : glc:dispatch  →  Route{type:"...", args:{...}}
#
# Kullanım:
#   data modify storage glc:dispatch Route set value {type:"menu/main"}
#   function custom_admin:handler/dispatch/main
#
# type değerleri için alt kısımdaki yorum bloğuna bakın.
# ═══════════════════════════════════════════════════════════════════

# ── 1. Varlık Kontrolü ─────────────────────────────────────────────
# Route yoksa sessizce dur — yanlış çağrılarda hata spam'i önler
execute unless data storage glc:dispatch Route run return 0

# ── 2. İzin Guard ──────────────────────────────────────────────────
# admin+ olmayan oyuncular sadece vip/player rotalarına erişebilir
# (Guard fonksiyonu return 1 dönerse yetkisiz, return 0 dönerse yetkili)
execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] \
    unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] \
    run function custom_admin:handler/dispatch/deny

execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] \
    unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] \
    run return 0

# ── 3. Macro Router'a Geç ──────────────────────────────────────────
function custom_admin:handler/dispatch/router with storage glc:dispatch Route

# ── 4. Temizlik — her koşulda Route silinir ────────────────────────
data remove storage glc:dispatch Route

# ═══════════════════════════════════════════════════════════════════
# DESTEKLENEN ROTA TİPLERİ
# ───────────────────────────────────────────────────────────────────
# DIALOG PANELLERİ    (trigger/dialog/* → schedule ile yüklenir)
#   dialog/main           Ana yönetim paneli
#   dialog/permissions    İzin yöneticisi
#   dialog/help           Yardım
#   dialog/about          Hakkında
#   dialog/actions        Eylem yöneticisi
#
# GLC MENÜ PANELLERİ  (trigger/menu/* → skor tabanlı builder'lar)
#   menu/main             Ana menü
#   menu/permissions      İzin listesi
#   menu/edit             Düzenleme
#   menu/settings         Ayarlar
#   menu/tpa              TPA paneli
#   menu/home             Home paneli
#   menu/vote             Oylama paneli
#   menu/warn             Uyarı paneli
#   menu/report           Rapor paneli
#   menu/nametag          NameTag paneli
#   menu/custom_action    Özel eylem paneli
#
# PANEL / FEATURE     (trigger/panel/* → özellik sayfaları)
#   panel/fun             Eğlence araçları
#   panel/automation      Otomasyon paneli
#   panel/players         Oyuncu yönetimi
#   panel/effects         Özel efektler
#   panel/teleport        Hızlı TP
#   panel/system          Sistem kontrolü
#
# ITEM PANELLERİ
#   item/mod_kit          Mod kiti paneli
#   item/admin_panel      Admin paneli
#   item/quick_action     Hızlı eylem
#   item/spy              Spy modu
#   item/broadcast        Duyuru paneli
#
# ROL / ATAMA
#   role/assign           args:{target:"OyuncuAdi", role:"admin|mod|vip|player|owner"}
#
# EYLEM YÜRÜTME
#   action/run            args:{id:"eylem_id"}  ← glc:data actions[] kullanır
#
# PROGRAM / ZAMANLI
#   schedule/add          args:{action_id:"...", delay:20, player:"OyuncuAdi"}
#   schedule/list         Zamanlanmış görev listesi
#
# UTIL
#   util/cleanup          Genel temizlik
#   util/settings         Ayarları göster
#   util/settings/reset   Ayarları sıfırla
# ═══════════════════════════════════════════════════════════════════
