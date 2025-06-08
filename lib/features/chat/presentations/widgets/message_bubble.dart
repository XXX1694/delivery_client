import 'package:delivery_client/features/chat/presentations/pages/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: message.isMe ? Color(0xFF446AEF) : Color(0xFFE2E2E2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: message.isMe ? Radius.circular(20) : Radius.circular(0),
                bottomRight: message.isMe ? Radius.circular(0) : Radius.circular(20),
              ),
            ),
            child: Text(message.content, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(message.time, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFA1A1A1))), SizedBox(width: 4), SvgPicture.asset('assets/icons/check_read.svg')],
          ),
        ],
      ),
    );
  }
}