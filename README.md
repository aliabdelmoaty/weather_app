# Weather App 🌦️

A Flutter-based weather application that provides real-time weather updates, forecasts, and air quality information using the [WeatherAPI](https://www.weatherapi.com/).

## Features ✨
- **Current Weather**: Displays temperature, humidity, wind speed, and conditions for your location.
- **Search Functionality**: Search for weather data by city name.
- **Hourly Forecast**: View temperature trends for specific hours of the day.
- **Air Quality Index**: Shows air quality metrics (CO, NO2, O3, etc.).
- **Responsive Design**: Adapts to screen sizes using `flutter_screenutil`.
- **Location Services**: Automatically fetches weather for your current location.

---

## Usage 📱

1. **Splash Screen**:  
   - Tap "Get Start" to navigate to the home screen.

2. **Home Screen**:  
   - Displays current weather and hourly forecasts.
   - Tap the 🔍 icon to search for a city.

3. **Search Screen**:  
   - Enter a city name (e.g., "London").
   - View weather details for the searched location.

---
## Installation 🛠️

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- An API key from [WeatherAPI](https://www.weatherapi.com/)

### Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/weather-app.git
   cd weather-app
   ```

2. **Add your API key**:
   - Replace the placeholder in `dio_helper.dart`:
   ```dart
   // In dio_helper.dart
   final String baseUrl = "http://api.weatherapi.com/v1/forecast.json?key=YOUR_API_KEY&days=1&aqi=yes&alerts=yes&q=";
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## Project Structure 📁

```
lib/
├── core/
│   ├── app_router.dart        # Routing configuration
│   ├── constants.dart         # Colors and themes
│   ├── dio_helper.dart        # API client setup
│   ├── weather_model/         # Data models (e.g., Current, Forecast, AirQuality)
│   └── widgets/               # Reusable components (CustomImage, HourWeather)
├── features/
│   ├── home/                  # Home screen with weather data
│   ├── search/                # City search functionality
│   └── splash/                # Splash screen
└── main.dart                  # App entry point
```

---

## Dependencies 📦

| Package              | Usage                                  |
|----------------------|----------------------------------------|
| `flutter_bloc`       | State management                       |
| `go_router`          | Navigation                             |
| `dio`                | HTTP requests                          |
| `geocode`            | Reverse geocoding                      |
| `location`           | Fetch device location                  |
| `flutter_screenutil` | Responsive UI design                   |

---


## Architecture 🏗️

- **BLoC Pattern**:  
  - State management using `WeatherDataCubit` and `SearchWeatherCubit`.
- **API Integration**:  
  - Data fetched via `DioHelper` from WeatherAPI.
- **Navigation**:  
  - Implemented using `go_router` for declarative routing.

---

