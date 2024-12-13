# Dynamic Leaderboard

A real-time, animated leaderboard with a festive gradient design and smooth animations, built with Flutter.


## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Implementation Details](#implementation-details)
- [Design Decisions](#design-decisions)
  

## Features

- Real-time score updates every 2 seconds
- Smooth animations for score changes
- Gradient background for a modern look
- Responsive design for various screen sizes


## Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

- Flutter SDK (v3.0 or later)
- A code editor such as Visual Studio Code or Android Studio
- An emulator or a physical device for testing

### Installation

1. Clone the repository or download the source code.
2. Install the required dependencies: flutter pub get
3. Run the app on your preferred emulator or device: flutter run

## Implementation Details

1. Dart Language with Flutter Framework: The app is built entirely in Flutter for cross-platform compatibility and rapid UI development.
2. State Management: The app uses setState for managing state and dynamically updating participant scores and UI.
3. Animations: Utilizes AnimatedContainer and AnimatedDefaultTextStyle for smooth visual transitions during score changes

## Design Decisions

1. Custom Styling: Animated borders, shadows, and bold text are used to highlight changes in scores.
2. Responsiveness: The app's layout adapts well to different screen sizes, ensuring a great user experience on phones, tablets, and other devices.
3. Sorting and Highlighting: Participants are sorted dynamically by scores, with changes visually highlighted using animations.

