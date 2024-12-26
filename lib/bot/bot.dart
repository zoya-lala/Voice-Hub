import 'dart:async';

class BotService {
  // A list of users in the voice room
  final List<String> _participants = [];

  // This stream allows the bot to monitor conversation (mock behavior)
  final StreamController<String> _messageStreamController =
      StreamController<String>();

  // Method to add a participant (simulate user joining)
  void addParticipant(String username) {
    _participants.add(username);
    print('$username has joined the voice room.');
    _notifyBot('New user joined: $username');
  }

  // Method to remove a participant (simulate user leaving)
  void removeParticipant(String username) {
    _participants.remove(username);
    print('$username has left the voice room.');
    _notifyBot('$username has left the voice room.');
  }

  // Method to simulate the bot monitoring conversation
  void listenToConversation(String message) {
    // In a real scenario, this could involve speech-to-text or more complex logic
    print('Bot is monitoring the conversation...');
    _notifyBot('Bot received message: $message');
  }

  // Method to notify the bot of important events or messages
  void _notifyBot(String notification) {
    _messageStreamController.add(notification);
  }

  // Stream that the bot listens to for notifications
  Stream<String> get botNotifications => _messageStreamController.stream;

  // Clean up when no longer needed (important for stream controllers)
  void dispose() {
    _messageStreamController.close();
  }
}
