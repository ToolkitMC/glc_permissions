# 🎮 GULCE Admin Power

Minecraft için gelişmiş izin ve menü yönetim sistemi.

## ✨ Özellikler

- 🔐 **Dinamik İzin Sistemi** - Storage tabanlı izin yönetimi
- 📋 **İnteraktif Menüler** - Dialog API ile modern menüler
- ⏰ **Zamanlayıcı Sistemi** - Zamanlanmış eylemler
- 👥 **Grup Yönetimi** - Oyuncuları gruplara ayırma
- ⚙️ **Özel Ayarlar** - Dinamik buton ekleme sistemi
- 🎯 **Çok Oyunculu Uyumlu** - Player Head Selector ile @p kullanmadan

## 📦 Kurulum

1. [Releases](../../releases) sayfasından en son sürümü indirin
2. ZIP dosyasını `world/datapacks/` klasörüne atın
3. Oyunda `/reload` komutunu çalıştırın
4. Admin tag'i verin: `/tag @s add gulce_admin`

## 🎯 Kullanım

### Menüyü Açma
```mcfunction
/trigger gulce_menu set 1
```

### İzin Ekleme
```mcfunction
/function custom_admin:add/permission {id:"perm1",player:"Player",permission:"admin",level:5}
```

### Zamanlama Ekleme
```mcfunction
/function custom_admin:schedule/add {action_id:"test",delay:100,player:"@s"}
```

## 🔧 Gereksinimler

- Minecraft 1.21.4+
- Pack Format: 48

## 📖 Dokümantasyon

Detaylı kullanım için [Wiki](../../wiki) sayfasını ziyaret edin.

## 🐛 Sorun Bildirme

Bir hata buldunuz mu? [Issue açın](../../issues/new)!

## 📄 Lisans

MIT License - Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 💖 Katkıda Bulunma

Katkılar memnuniyetle karşılanır! [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına göz atın.

---

**Yapımcı:** GULCE Dev Team  
**Versiyon:** 3.1.0  
**Son Güncelleme:** 2025
