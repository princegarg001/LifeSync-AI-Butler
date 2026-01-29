# 🤖 LifeSync AI Butler

> Your intelligent personal productivity companion powered by Google Gemini AI

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Serverpod](https://img.shields.io/badge/Serverpod-3.2-purple)](https://serverpod.dev)
[![Gemini AI](https://img.shields.io/badge/Gemini-AI-green?logo=google)](https://ai.google.dev)

## 🌟 Features

### 🎤 AI Voice Butler
- **Voice Commands** - Talk to your AI assistant hands-free
- **Natural Language Processing** - Create tasks just by speaking
- **Smart Daily Briefings** - Get personalized productivity summaries

### ✅ Smart Task Management
- AI-powered task creation from natural language
- Priority-based organization (Low, Medium, High, Urgent)
- Recurring task patterns
- Smart reminders

### 💬 AI Chat Interface
- Conversational task management
- Schedule queries
- Productivity insights on demand

### 📊 Productivity Analytics
- Weekly progress charts
- Streak tracking
- AI-generated recommendations
- Peak performance time detection

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Frontend** | Flutter (Dart) |
| **Backend** | Serverpod |
| **Database** | PostgreSQL |
| **Cache** | Redis |
| **AI** | Google Gemini |
| **UI** | Glassmorphism, Custom Animations |

## 📁 Project Structure

```
my_project/
├── my_project_flutter/     # Flutter mobile/web app
├── my_project_server/      # Serverpod backend
├── my_project_client/      # Shared client code (auto-generated)
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.x or higher)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Serverpod CLI](https://docs.serverpod.dev/get-started)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/lifesync-ai-butler.git
   cd lifesync-ai-butler
   ```

2. **Start the database containers**
   ```bash
   cd my_project_server
   docker-compose up -d
   ```

3. **Set up your Gemini API Key**
   Create a `.env` file in `my_project_server/config/`:
   ```
   GEMINI_API_KEY=your_api_key_here
   ```

4. **Run the backend server**
   ```bash
   cd my_project_server
   dart run bin/main.dart
   ```

5. **Run the Flutter app**
   ```bash
   cd my_project_flutter
   flutter pub get
   flutter run -d chrome  # or your preferred device
   ```

## 🎯 Usage

### Voice Commands
- "Give me my daily briefing"
- "Create a task to buy groceries tomorrow"
- "What's on my schedule today?"
- "Show my productivity insights"

### Chat Commands
- "Add a meeting with John at 3pm"
- "Show my pending tasks"
- "Complete the presentation task"

## 🏗️ Architecture

```
┌─────────────────┐     ┌─────────────────┐
│  Flutter App    │────▶│  Serverpod API  │
│  (UI/Voice)     │◀────│  (Backend)      │
└─────────────────┘     └────────┬────────┘
                                 │
                    ┌────────────┼────────────┐
                    ▼            ▼            ▼
              ┌──────────┐ ┌──────────┐ ┌──────────┐
              │PostgreSQL│ │  Redis   │ │ Gemini   │
              │ (Data)   │ │ (Cache)  │ │  (AI)    │
              └──────────┘ └──────────┘ └──────────┘
```

## 📱 Screenshots

| Dashboard | AI Chat | Voice Butler |
|:---------:|:-------:|:------------:|
| Productivity stats & insights | Conversational AI | Hands-free commands |

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Serverpod](https://serverpod.dev) - Amazing Flutter backend framework
- [Google Gemini](https://ai.google.dev) - Powerful AI capabilities
- [Flutter](https://flutter.dev) - Beautiful cross-platform UI

---

Made with ❤️ for the hackathon
