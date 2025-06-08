import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qna_ai/providers/message_provider.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController askController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Gemma_AI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment:
                        messages[index].isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Text(
                      messages[index].isUser
                          ? "User:${messages[index].text}"
                          : "AI:${messages[index].text}",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Text(
              "What can I help you with?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: askController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Ask....",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    ref
                        .read(messageProvider.notifier)
                        .addUserMessage(askController.text);

                    ref
                        .read(messageProvider.notifier)
                        .addAiMessage("AI: " + askController.text);
                    askController.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
