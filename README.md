# 🔥 GHOST HIT SYSTEM v2.0

## 📋 الوصف
نظام Ghost Hit الحقيقي بدون ImGui - يعمل فوق أي تطبيق حتى لو كان في الخلفية!

## ✨ المميزات
- 👻 **Ghost Hit System** - نظام الشبح الكامل
- 📡 **Teleport Lag** - تأثير التليبورت
- 🚀 **Speed Burst** - انفجار السرعة
- ❄️ **Freeze Enemy** - تجميد الأعداء
- 💥 **Damage Multiplier** - مضاعفة الضرر
- 🛡️ **Anti-Hit** - منع الضرر الواصل
- 🎯 **No Recoil** - إلغاء الارتداد
- ⚡ **TeleKill** - قتل التليبورت

## 🎮 المفاتيح (Keybinds)
| المفتاح | الوظيفة | الوصف |
|---------|---------|-------|
| `Ctrl + G` | Ghost Hit System | تفعيل/إيقاف نظام الشبح |
| `Ctrl + F` | Toggle Ghost Mode | تبديل وضع الشبح |
| `Ctrl + T` | Teleport Lag | تفعيل/إيقاف تأثير التليبورت |
| `Ctrl + S` | Speed Burst | تفعيل/إيقاف انفجار السرعة |
| `Ctrl + E` | Freeze Enemy | تفعيل/إيقاف تجميد الأعداء |
| `Ctrl + D` | Damage Multiplier | تفعيل/إيقاف مضاعفة الضرر |
| `Ctrl + A` | Anti-Hit | تفعيل/إيقاف منع الضرر |
| `Ctrl + R` | No Recoil | تفعيل/إيقاف إلغاء الارتداد |
| `Ctrl + K` | TeleKill | تفعيل/إيقاف قتل التليبورت |
| `Ctrl + C` | Clear Buffer | مسح الذاكرة المؤقتة |
| `Ctrl + I` | Show Stats | عرض الإحصائيات |
| `Ctrl + ESC` | Exit | خروج من النظام |

## 🚀 التثبيت والتشغيل

### المتطلبات
- Windows 10/11
- Visual Studio 2019+ أو MinGW
- CMake 3.16+

### البناء باستخدام CMake
```bash
# إنشاء مجلد البناء
mkdir build
cd build

# تكوين المشروع
cmake ..

# بناء المشروع
cmake --build . --config Release

# تشغيل البرنامج
./bin/GhostHitSystem.exe
```

### البناء باستخدام Visual Studio
```bash
# فتح Visual Studio Developer Command Prompt
# ثم تشغيل:
cmake -G "Visual Studio 16 2019" ..
cmake --build . --config Release
```

### البناء باستخدام MinGW
```bash
cmake -G "MinGW Makefiles" ..
mingw32-make
```

## 🔧 كيفية الاستخدام

1. **تشغيل البرنامج** - سيفتح نافذة console مع قائمة المفاتيح
2. **تفعيل النظام** - استخدم `Ctrl + G` لتفعيل Ghost Hit System
3. **التحكم** - استخدم المفاتيح المذكورة أعلاه للتحكم في المميزات
4. **العمل في الخلفية** - النظام يعمل فوق أي تطبيق حتى لو كان في الخلفية!

## ⚠️ ملاحظات مهمة

- **يجب تشغيل البرنامج كـ Administrator** للحصول على صلاحيات Global Hook
- النظام يعمل فوق أي تطبيق بما في ذلك الألعاب
- المفاتيح تعمل حتى لو كان التطبيق في الخلفية
- استخدم `Ctrl + ESC` للخروج من النظام

## 🐛 استكشاف الأخطاء

### مشكلة: "Failed to install keyboard hook"
**الحل:** تأكد من تشغيل البرنامج كـ Administrator

### مشكلة: المفاتيح لا تعمل
**الحل:** تأكد من أن البرنامج يعمل وأن Global Hook مثبت بنجاح

### مشكلة: البرنامج لا يفتح
**الحل:** تأكد من تثبيت Visual C++ Redistributable

## 📝 الترخيص
هذا المشروع مخصص للاستخدام التعليمي والبحثي فقط.

## 🤝 المساهمة
نرحب بالمساهمات! يرجى إنشاء Issue أو Pull Request.

---

**⚠️ تحذير:** هذا النظام مخصص للاستخدام التعليمي والبحثي فقط. يرجى استخدامه بمسؤولية.