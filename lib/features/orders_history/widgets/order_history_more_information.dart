import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_client/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OrderHistoryMoreInformation extends StatelessWidget {
  const OrderHistoryMoreInformation({super.key, this.onTap, this.buttonTitle});
  final Function()? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 16),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: CachedNetworkImageProvider("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s"), radius: 20),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Курьер", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA1A1A1))),
              Text("Адилет Адилбеков", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
            ],
          ),
          Spacer(),
          if (onTap == null || buttonTitle == null)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Utils.callPhoneNumber('77777777777');
                  },
                  child: SvgPicture.asset('assets/icons/phone.svg'),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // print('dsd');
                    context.pushNamed('chat');
                  },
                  child: SvgPicture.asset('assets/icons/chat.svg'),
                ),
              ],
            ),

          if (onTap != null && buttonTitle != null)
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFFF564A))),
                child: Text(buttonTitle!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFF564A))),
              ),
            ),
        ],
      ),
    );
  }
}
