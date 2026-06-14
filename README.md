<h1 align="center">🌿 Cotton Weed Detection App</h1>

<p align="center">
  An AI-powered mobile application that detects weeds in cotton crops using a TFLite deep learning model.<br/>
  Built to help farmers identify <strong>Horse Purslane</strong> and <strong>Purple Nutsedge</strong> with a single photo.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/TensorFlow_Lite-Model-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white"/>
  <img src="https://img.shields.io/badge/React-18-61DAFB?style=for-the-badge&logo=react&logoColor=black"/>
  <img src="https://img.shields.io/badge/Vite-6-646CFF?style=for-the-badge&logo=vite&logoColor=white"/>
  <img src="https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge"/>
</p>

---

## 📌 Overview

This repository contains an AI-powered cotton weed detection system developed at **Sukkur IBA University** as part of research in precision agriculture. The system uses a deep learning model trained on the **CottonWeeds dataset (Kaggle)** to classify images of cotton crops and identify two of the most damaging weeds — *Trianthema portulacastrum* (Horse Purslane) and *Cyperus rotundus* (Purple Nutsedge).

> **Primary App:** The Flutter mobile app (`cotton_weed_app/`) is the production-ready application with the real TFLite classifier.

> **Web UI:** The root-level React/Vite project is a **UI prototype** (Figma Make export) demonstrating the app's interface in a browser — detection results in the web version are simulated.

---

## ⚙️ How It Works

| Step | Stage | Description |
|------|-------|-------------|
| 1 | **Image Input** | User captures a photo via camera or uploads from gallery |
| 2 | **Preprocessing** | Image is resized and normalized to match model input shape |
| 3 | **Inference** | TFLite model runs on-device to classify the weed type |
| 4 | **Result Display** | App shows detected weed name, confidence score, and recommended action |

---

## 📁 Project Structure

```
Cotton-Weed-Detection-App/
│
├── cotton_weed_app/           # Flutter mobile application (primary)
│   ├── lib/
│   │   ├── screens/           # UI screens (Splash, Home, Detection, Info)
│   │   ├── services/          # TFLite classifier service
│   │   ├── widgets/           # Reusable UI widgets
│   │   ├── theme.dart         # App theme & color palette
│   │   └── main.dart          # Entry point
│   ├── assets/
│   │   ├── model.tflite       # Deep learning model (tracked via Git LFS)
│   │   ├── labels.txt         # Weed class labels
│   │   └── icon.png           # App launcher icon
│   └── pubspec.yaml
│
├── src/                       # React/Vite web UI prototype
│   ├── app/
│   │   ├── components/        # Screen components (Splash, Home, Detection, Info)
│   │   └── App.tsx
│   └── styles/                # Global CSS, theme, fonts
│
├── index.html
├── package.json
├── vite.config.ts
├── .gitignore
└── README.md
```

> **Note:** `model.tflite` is tracked via **Git LFS**. Run `git lfs pull` after cloning to download it.

---

## 🚀 Getting Started

### Flutter Mobile App (Primary)

#### Prerequisites
- Flutter SDK `^3.x` and Dart SDK `^3.10.3`
- Android Studio or Xcode (for emulator/device)
- A physical device or emulator with camera access

#### Steps

**Step 1 — Clone the repository**
```bash
git clone https://github.com/SibghaMursaleen/Cotton-Weed-Detection-App.git
cd Cotton-Weed-Detection-App
```

**Step 2 — Pull the LFS model file**
```bash
git lfs pull
```

**Step 3 — Install Flutter dependencies**
```bash
cd cotton_weed_app
flutter pub get
```

**Step 4 — Run the app**
```bash
flutter run
```

---

### Web UI Prototype

#### Prerequisites
- Node.js `>=18` and npm

#### Steps

**Step 1 — Install dependencies**
```bash
npm install
```

**Step 2 — Start the dev server**
```bash
npm run dev
```

> ⚠️ The web prototype shows a **simulated detection result**. It does not run the actual TFLite model. For real inference, use the Flutter mobile app.

---

## 🛠️ Tech Stack

| Technology | Role |
|------------|------|
| **Flutter** | Cross-platform mobile UI framework |
| **Dart** | Primary programming language |
| **TensorFlow Lite** | On-device deep learning inference |
| **tflite_flutter** | Flutter plugin for TFLite model execution |
| **image_picker / camera** | Camera capture and gallery access |
| **Google Fonts** | Typography (Inter) |
| **React 18** | Web UI prototype framework |
| **Vite 6** | Web build tool and dev server |
| **TypeScript** | Type-safe web components |
| **Tailwind CSS v4** | Utility-first styling for web prototype |
| **Framer Motion** | Animations in the web prototype |
| **shadcn/ui** | UI component library for web prototype |

---

## 🌱 Dataset

| Property | Details |
|----------|---------|
| **Source** | CottonWeeds Dataset — [Kaggle](https://www.kaggle.com/datasets/sowmyamyneni/cottonweed-db) |
| **Target Classes** | Horse Purslane (*Trianthema portulacastrum*), Purple Nutsedge (*Cyperus rotundus*) |
| **Approach** | Deep Learning — Image Classification |
| **Model Format** | TensorFlow Lite (`.tflite`) |

---

## ⚠️ Tips for Best Results

- Ensure the weed is **clearly visible and centered** in the frame
- Use **good lighting** — avoid shadows or overexposure
- Capture images **close to the plant**, not from a wide angle
- Clean the camera lens before capturing
- Works best with **in-field photos** rather than stock images

---

## 👥 Team

| Name | Role |
|------|------|
| **[Sibgha Mursaleen](https://github.com/SibghaMursaleen)** | Project Developer |
| **[Muhammad Usman Sarwar](https://github.com/Usmansarwar143)** | Project Developer |

**Institution:** Sukkur IBA University — Department of Computer Systems Engineering

---

## 🔗 Related Projects

This project is part of a larger Cotton Weed Detection system:

| Repository | Description |
|------------|-------------|
| **[Cotton Weed Detection App](https://github.com/SibghaMursaleen/Cotton-Weed-Detection-App)** *(this repo)* | Flutter mobile app with TFLite on-device inference |
| **[Cotton Weed Detection Website](https://github.com/SibghaMursaleen/Cotton-Weed-Detection-Website)** | Web version of the weed detection system |

---

## 📄 License

This project is released under the [MIT License](LICENSE) — free to use, modify, and distribute.

---

<p align="center">
  Built with 🌿 Flutter &nbsp;·&nbsp; TensorFlow Lite &nbsp;·&nbsp; Sukkur IBA University
</p>