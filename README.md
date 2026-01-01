# ServeHome 🏠 – Ultimate Home Service Booking App

[![Flutter](https://img.shields.io/badge/Flutter-3.29.3-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7.2-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

---

## 🌟 Project Overview
**ServeHome** is a **professional, high-performance Flutter application** designed to provide a seamless **home service booking experience**.  
It is built using **Clean Architecture**, following best practices for **scalable and maintainable code**.  
The app supports **mobile and web platforms**, features **real-time booking updates**, **multi-method payments**, and persistent authentication.

---

## 🏆 Key Features
- **Authentication & Security**
  - Sign Up / Sign In / Sign Out
  - Password update & persistent login with SharedPreferences
  - Firebase Authentication integration
- **Booking System**
  - View all bookings (pending, in-progress, completed, canceled)
  - Real-time updates using Firestore streams
  - Create, cancel, or update bookings
- **Services**
  - Browse services with details
  - Dynamic UI for service listings
- **Payment Methods**
  - Credit/Debit Card
  - Cash
  - Apple Pay
- **Responsive UI**
  - Adaptive layouts for mobile & web
- **State Management**
  - Provider for efficient state updates
- **Clean Architecture**
  - Full separation of **Presentation**, **Domain**, and **Data** layers
- **Error Handling**
  - Loading indicators & snackbars for smooth UX
- **Logging & Debugging**
  - Detailed logs for tracking app behavior

---
## 🏗 Project Structure

**Layer Explanation:**
- **Presentation:** UI & state management (Provider)  
- **Domain:** Business logic & UseCases  
- **Data:** Firebase repositories, models, and local storage

---

## 🎨 Screenshots & Design Preview

| Home Page | Services Page | Booking Page |
|-----------|---------------|--------------|
| ![Home](ServeHome/Screenshot_1767275035.png) | ![Services](screenshots/services.png) | ![Booking](screenshots/booking.png) |

| Payment Page | Profile Page |
|--------------|--------------|
| ![Payment](screenshots/payment.png) | ![Profile](screenshots/profile.png) |

> ⚡ Screenshots can be replaced with **interactive Figma prototypes** for live previews.

---

## 🚀 Getting Started

### Prerequisites
- Flutter **3.29.3**
- Dart **3.7.2**
- Firebase project configured

### Installation
```bash
https://github.com/MohammedMatter/serveHome.git


