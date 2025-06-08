import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qna_ai/models/chat_message.dart';

class MessageNotifier extends StateNotifier<List<ChatMessage>> {
  MessageNotifier() : super([]);

  void addUserMessage(String text) {
    state = [...state, ChatMessage(text: text, isUser: true)];
  }

  void addAiMessage(String text) {
    state = [...state, ChatMessage(text: text, isUser: false)];
  }

  void clear() {
    state = [];
  }
}

final messageProvider =
    StateNotifierProvider<MessageNotifier, List<ChatMessage>>(
      (ref) => MessageNotifier(),
    );
