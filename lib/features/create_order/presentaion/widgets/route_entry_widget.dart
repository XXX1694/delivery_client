
import 'package:delivery_client/features/create_order/presentaion/widgets/select_address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RouteEntryWidget extends StatelessWidget {
  const RouteEntryWidget({super.key, required this.title, required this.icon, required this.addressController, required this.onTap});
  final String title;
  final String icon;
  final TextEditingController addressController;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.only(top: 24, bottom: 14, left: 26, right: 28),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFEEEEEE), width: 1), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF9E9E9E))),
                  SelectAddressItem(controller: addressController, hint: 'Алматы', icon: "assets/icons/left_arrow.svg", iconQuarterTurns: 3),
                  const Divider(height: 1, color: Color(0xFFEEEEEE)),
                  SelectAddressItem(controller: addressController, hint: 'Шымкент', icon: "assets/icons/map.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}