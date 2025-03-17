import 'package:flutter/material.dart';
import 'package:foodcourier/chat_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Chat", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        automaticallyImplyLeading: false, // Remove back button if not needed
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ChatBubble(
                    text: message['text'],
                    isUser: message['isUser'],
                  );
                },
              ),
            ),
          ),
          Obx(
            () =>
                chatController.isTyping.value
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Food Runs typing..."),
                      ),
                    )
                    : SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: () {
                    chatController.sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.red : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(color: isUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:foodcourier/chat_controller.dart';
// import 'package:get/get.dart';

// class ChatScreen extends StatelessWidget {
//   final ChatController chatController = Get.put(ChatController());
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey, // Light background
//       appBar: AppBar(
//         title: const Text(
//           "Chat",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.grey.shade200, // Matches the gradient background
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         // flexibleSpace: Container(
//         //   decoration: const BoxDecoration(
//         //     gradient: LinearGradient(
//         //       colors: [Colors.pink, Colors.red],
//         //       begin: Alignment.topLeft,
//         //       end: Alignment.bottomRight,
//         //     ),
//         //   ),
//         // ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 padding: const EdgeInsets.all(10),
//                 itemCount: chatController.messages.length,
//                 itemBuilder: (context, index) {
//                   final message = chatController.messages[index];
//                   return ChatBubble(
//                     text: message['text'],
//                     isUser: message['isUser'],
//                   );
//                 },
//               ),
//             ),
//           ),
//           Obx(
//             () =>
//                 chatController.isTyping.value
//                     ? const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Food Runs is typing...",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     )
//                     : const SizedBox.shrink(),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       controller: _controller,
//                       decoration: const InputDecoration(
//                         hintText: "Type a message...",
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     chatController.sendMessage(_controller.text);
//                     _controller.clear();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.red,
//                     ),
//                     child: const Icon(Icons.send, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isUser;

//   const ChatBubble({super.key, required this.text, required this.isUser});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isUser ? Colors.redAccent : Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16),
//             topRight: const Radius.circular(16),
//             bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
//             bottomRight: isUser ? Radius.zero : const Radius.circular(16),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 3,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(color: isUser ? Colors.white : Colors.black),
//         ),
//       ),
//     );
//   }
// }
