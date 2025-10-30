🚀 Yolliday App
This repository contains the source code for the Yolliday App, a highly responsive and pixel-accurate Flutter implementation based on the provided Figma design.

---

 ✨ Key Features & Technical Highlights

The application is developed with a strong emphasis on **clean architecture**, **pixel precision**, and **robust responsiveness**, strictly adhering to all provided Figma specifications and development guidelines.

---

 1. 📐 Pixel-Perfect & Responsive Design

- **Full Responsiveness:**  
  Achieved through the exclusive, consistent use of the `flutter_screenutil` package across all dimensions (`.w`, `.h`, `.sp`).  
  This guarantees that the UI scales proportionally and consistently across all mobile screen sizes and densities.

- **Custom 60.h Navigation Bar:**  
  The bottom navigation bar was built using a custom `Row` + `InkWell` structure (in `main_shell.dart`) instead of Flutter’s standard `BottomNavigationBar`.  
  This implementation enforces the exact **60.h** height constraint from Figma and completely eliminates render overflow issues — ensuring perfect design compliance and responsiveness.

- **Local Asset Fonts:**  
  All typography uses **local Roboto font assets**, configured in `pubspec.yaml`.  
  This ensures fast loading and meets the requirement to avoid network-based font providers like Google Fonts.

---

 🧩 Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Responsiveness:** flutter_screenutil
- **Architecture:** Clean, component-based layout structure
- **Design Source:** Figma (Pixel-perfect reference)

---

 🧠 Developer Notes

- Every widget, spacing, and radius value has been converted from Figma’s pixel units to responsive `ScreenUtil` values (`.w`, `.h`, `.sp`, `.r`).
- No fixed pixel dimensions are used anywhere in the UI.
- The custom navigation bar ensures zero pixel overflow across all tested devices (including those with different aspect ratios and safe areas).

---

 Result:
A visually identical, device-adaptive Flutter app that maintains perfect design integrity across all screen sizes — precisely matching the original Figma layout.
