# 🚀 Smart ERP - Integrated Business Management Suite

[![Flutter](https://img.shields.io/badge/Flutter-v3.0+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-v3.0+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Windows-blue)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Smart ERP** is a state-of-the-art, modular Enterprise Resource Planning application designed for modern businesses. Built with Flutter, it offers a seamless, high-performance experience across mobile and desktop platforms, empowering organizations to manage their core operations from a single, unified dashboard.

---

## ✨ Core Modules

The application is structured into specialized modules, each targeting a critical aspect of business management:

### 👥 HRM Suite (Workforce Management)
*   **Employee Records:** Comprehensive database for staff details.
*   **Attendance & Payroll:** Automated tracking and salary processing.
*   **Performance Tracking:** KPI monitoring and appraisals.

### 🤝 CRM Hub (Customer Relations)
*   **Lead Management:** Track potential clients from inquiry to conversion.
*   **Pipeline Visualization:** Stay on top of your sales funnel.
*   **Customer Support:** Integrated ticketing and feedback system.

### 🛒 Purchase ERP (Procurement)
*   **Vendor Management:** Maintain strong relationships with suppliers.
*   **RFQ Processing:** Streamlined Request for Quotations.
*   **Inventory Integration:** Real-time stock updates on purchase.

### 📊 Sales Module (Revenue & Orders)
*   **Order Fulfillment:** End-to-end sales order processing.
*   **Invoice Management:** Professional invoicing and automated tracking.
*   **Revenue Analytics:** Visual charts for sales trends and profitability.

---

## 🛠️ Tech Stack & Architecture

*   **Frontend Framework:** [Flutter](https://flutter.dev) (for high-fidelity UI)
*   **Programming Language:** [Dart](https://dart.dev)
*   **UI/UX Enhancements:**
    *   `flutter_screenutil` for responsive design.
    *   `animate_do` for smooth micro-animations.
    *   `google_fonts` (Syne & DM Sans) for premium typography.
*   **Visualization:** `fl_chart` for dynamic business intelligence graphs.
*   **Project Structure:** Modularized workspace allowing independent development and scaling of each module (CRM, HRM, Purchase, Sales).

---

## 📸 Premium User Interface

Smart ERP features a **Modern Glassmorphism** and **Clean Dark/Light mode** aesthetic, ensuring that data-heavy business tasks are easy on the eyes and intuitive to navigate.

*   Vibrant, curated color palettes.
*   Interactive dashboard with real-time stats.
*   Smooth page transitions and micro-interactions.

---

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK (v3.0.0 or higher)
*   Dart SDK (v3.0.0 or higher)
*   Android Studio / VS Code with Flutter extension

### Installation
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-repo/erp-smart-app.git
    cd erp-smart-app
    ```

2.  **Install dependencies:**
    Since this is a modular project, dependencies are handled across the root and the sub-modules.
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 📂 Folder Structure

```text
lib/
├── ERP_HomeScreen/     # Root dashboard and authentication
│   ├── LoginScreen/    # Auth logic and UI
│   └── dashboard.dart  # Main App Hub
├── ERP_Moduels/        # Shared module logic
CRM/                    # CRM Module Workspace
hrm/                    # HRM Module Workspace
purchase_erp/           # Purchase Module Workspace
salees/                 # Sales Module Workspace
assets/                 # Centralized images, icons, and lottie files
```

---

## 🛡️ License
Distributed under the MIT License. See `LICENSE` for more information.

---
*Developed with ❤️ for Advanced Business Management.*
