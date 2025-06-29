import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_client/core/theme/colors.dart';
import 'package:delivery_client/core/utils/utils.dart';
import 'package:delivery_client/features/chat/presentations/widgets/message_bubble.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

final List<Message> messages = [
  Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", isMe: true, time: "10:58"),
  Message(content: "Добрый день", isMe: false, time: "10:58"),
  Message(content: "Добрый день", isMe: true, time: "10:58"),
];

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f5ff),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFFf4f5ff),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(width: 26),
                      CupertinoButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          context.pop();
                        },
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                          child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(backgroundImage: CachedNetworkImageProvider("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s"), radius: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Адилет Адилбеков', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16, overflow: TextOverflow.ellipsis)),

                            Text('Курьер', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(onTap: () => Utils.callPhoneNumber('777777777777'), child: SvgPicture.asset('assets/icons/phone.svg', width: 26, height: 26, fit: BoxFit.fill)),
                      SizedBox(width: 38),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),
            Container(width: double.infinity, height: 1, color: Colors.white),
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: messages[index]);
                },
              ),
            ),
            Container(width: double.infinity, height: 1, color: Colors.white),
            Container(
              color: Color(0xFFf4f5ff),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 26).copyWith(top: 24, bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (_) {},

                      maxLines: 5,
                      minLines: 1,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),

                      decoration: InputDecoration(
                        prefixIcon: Padding(padding: EdgeInsets.only(left: 20, right: 4), child: SvgPicture.asset('assets/icons/paperclip.svg')),
                        prefixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),

                        fillColor: Color(0xFFf4f5ff),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(31), borderSide: BorderSide(color: Colors.white)),
                        hintText: "Введите здесь",

                        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFFA1A1A1)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(31), borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(31), borderSide: BorderSide(color: Colors.white)),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: mainColor, shape: BoxShape.circle), child: SvgPicture.asset('assets/icons/plain.svg', width: 24, height: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String content;
  final bool isMe;
  final String time;

  Message({required this.content, required this.isMe, required this.time});
}
