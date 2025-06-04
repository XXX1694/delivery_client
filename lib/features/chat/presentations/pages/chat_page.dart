import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_client/features/widget/list_action_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                    child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                  ),
                ),

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
                SizedBox(width: 50),
                SvgPicture.asset('assets/icons/phone.svg', width: 26, height: 26),
                SizedBox(width: 38),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
            Container(
              color: Colors.white,
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
                        hintText: "Сообщение",
                        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        filled: true,

                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
