
# Flutter Chat Bot ChatGPT App


## Installation

1. Clone the repository:
   
2. Navigate to the project directory:
   ```sh
   cd Flutter_Chat_GPT_App
   ```
3. Add your OpenAi token:
   *Create an `.env` file:*
   ```sh
   touch .env
   ```
   *Edit the file:*
   `OPENAI_API_KEY='YOUR_OPENAI_TOKEN'`

4. Install dependencies:
   ```sh
   flutter pub get
   ```

## Usage

1. Run the project:
   ```sh
   flutter run
   ```

## File Structure

- `main.dart`: The entry point of the application. It initializes the app and sets the `HomePage` as the default route.
- `home_page.dart`: Contains the `HomePage` widget which serves as the main screen of the application.
- `chat_screen.dart`: Contains the `ChatScreen` widget which manages the chat interface.
- `config.dart`: Configuration file for the OpenAI token.

### main.dart

The `main.dart` file is the entry point of the Flutter application. It initializes the app and sets the `HomePage` as the default route.

### home_page.dart

The `home_page.dart` file defines the `HomePage` widget. This widget is the main screen that users see when they open the app. It contains a button that navigates to the `ChatScreen`.

### chat_screen.dart

The `chat_screen.dart` file defines the `ChatScreen` widget. This widget handles the chat interface, displaying a simple message.

### config.dart

The `config.dart` file contains configuration settings that are used throughout the application. It defines constants for the app name and screen titles.

## Configuration

You can update the configuration settings in the `config.dart` file to load `.env` file and get the token.

