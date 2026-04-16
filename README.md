# 🔵 Food Khan (Flutter Mobile App)

Experience the future of food delivery with a Flutter-powered interface designed for blazing-fast performance and zero friction.

- Visual Feast : High-definition galleries that make every dish look as good as it tastes.
- Seamless Flow : From cravings to checkout in just a few taps.
- Smart Logistics : Integrated location services and a secure COD system ensure arrives exactly where you are.

---

![image alt](https://github.com/MdSohidUllahChowdhury/Food-Khan/blob/main/lib/asset/image/food_khan_screen_shorts.png)

---

## 🔵 Project Preview

- Supabase-driven (REST + optional realtime stream)
- Firebase initialized (ready for auth / User Data Collection / analytics)
- Provider for app-wide state
- GetX for concise navigation and snackbars
- MVC-style organization: Models, Views (screens/widgets), Controllers (services/providers)

---

## 🔵 Key features

- Creat user account via Firebase Auth
- Display food items and details pulled from Supabase
- Detail screen for each item with add-to-cart support (Provider)
- Checkout flow with payment and delivery selection
- Profile picture feature

---

## 🔵 Architecture & Patterns

The project follows an MVC-style separation:

- Models: `lib/database/*` — data classes (e.g. `MenuInfo`) and `fromJson` parsing
- Views: `lib/view/*` and `lib/widget/*` — UI screens and reusable components
- Controllers: `lib/controller/*` — Supabase/Firebase services and Provider controllers

State & navigation approach:

- Provider: single source of truth for shared app state (cart, user session)
- GetX (`get`): navigation helpers and lightweight UI utilities (snackbars, `Get.to`)

This mix keeps business logic testable (controllers) while keeping UI code in view layers.

---

## 🔵 Tech stack

- Flutter & Dart
- Supabase (`supabase_flutter`) for backend data and optional realtime
- Firebase (`firebase_core`, `firebase_auth`, `cloud_firestore`) — init code present
- Provider — state management
- GetX (`get`) — routing and UI helpers
- UI libs: `google_fonts`, `font_awesome_flutter`, `flutter_animate`, `avatar_glow`

---

MIT — see `LICENSE` in the repository root.
