# Rick and Morty API App 🥼🧪💥

A simple Flutter application that showcases characters from the popular TV series "Rick and Morty" using the [Rick and Morty API](https://rickandmortyapi.com/). The app features a clean, responsive design with advanced functionality including infinite scrolling pagination, real-time search, and offline connectivity detection.

## 📱 App Preview
     

https://github.com/user-attachments/assets/c0d59c25-034c-451f-b8c7-f2ba0123dbfd



## ✨ Features

- **Character Gallery**: Browse through all Rick and Morty characters in a responsive grid layout
- **Infinite Scrolling**: Seamlessly load more characters as you scroll down
- **Real-time Search**: Find characters instantly with dynamic search functionality
- **Dynamic App Bar**: Context-aware app bar that transforms during search
- **Offline Detection**: Network connectivity monitoring with user-friendly indicators
- **Loading States**: Smooth loading animations and states for better UX
- **Responsive Design**: Optimized for different screen sizes and orientations
- **Clean Architecture**: Well-structured codebase following Flutter best practices

## 🏗️ Architecture

This project follows a **layered architecture** pattern with clear separation of concerns:

```
lib/
├── constants/           # App-wide constants (colors, strings)
├── data/
│   ├── models/         # Data models and entities
│   ├── repos/          # Repository implementations
│   └── services/       # API services and data sources
├── helper/             # Utility functions and configurations
└── presentation/
    ├── logic/          # Business logic (BLoC/Cubit)
    └── views/          # UI screens and widgets
```

### Key Architectural Patterns

- **BLoC Pattern**: State management using `flutter_bloc`
- **Repository Pattern**: Data abstraction layer
- **Dependency Injection**: Service locator with `get_it`
- **Single Responsibility**: Each class has one clear purpose

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **flutter_bloc**: State management solution
- **dio**: HTTP client for API calls
- **get_it**: Service locator for dependency injection
- **flutter_spinkit**: Loading animations
- **flutter_offline**: Network connectivity detection
- **animated_text_kit**: Text animations

## 📡 API

This app consumes the [Rick and Morty API](https://rickandmortyapi.com/), which provides:

- Character information (name, status, species, location, etc.)
- Pagination support
- No authentication required
- RESTful endpoints

### API Endpoints Used

- `GET /api/character` - Fetch characters with pagination
- `GET /api/character/?page={page}` - Fetch specific page
