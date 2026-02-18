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

1. [Releases](https://github.com/ToolkitMC/glc_permissions/releases) sayfasından en son sürümü indirin
2. ZIP dosyasını `world/datapacks/` klasörüne atın
3. Oyunda `/reload` komutunu çalıştırın
4. Admin tag'i verin: `/tag @s add gulce_admin`

## 🎯 Kullanım


### İzin Ekleme
```mcfunction
/function custom_admin:api/add/permission {id:"perm1",player:"Player",permission:"admin",level:5}
```

### Zamanlama Ekleme
```mcfunction
/function custom_admin:api/schedule/add {action_id:"test",delay:100,player:"@s"}
```

## 🔧 Gereksinimler

- Minecraft 1.21.7+
- Pack Format: 81

## 📖 Dokümantasyon

Detaylı kullanım için [Wiki](../../wiki) sayfasını ziyaret edin.

## 🐛 Sorun Bildirme

Bir hata buldunuz mu? [Issue açın](https://github.com/ToolkitMC/glc_permissions/issues)!

## 📄 Lisans

MIT License - Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 💖 Katkıda Bulunma

Katkılar memnuniyetle karşılanır! [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına göz atın.

---

**Yapımcı:** GULCE Dev Team  
**Son Güncelleme:** 2025
