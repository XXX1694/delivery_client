
import 'package:delivery_client/features/orders_history/presentations/pages/orders_history_page.dart';
import 'package:delivery_client/features/orders_history/widgets/order_history_more_information.dart';
import 'package:delivery_client/features/orders_history/widgets/order_information_processing_type.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersHistoryWidget extends StatelessWidget {
  const OrdersHistoryWidget({super.key, required this.orderType, required this.isSelected});
  final bool isSelected;
  final OrderType orderType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 16, right: 20),
      decoration: BoxDecoration(border: isSelected ? Border.all(color: const Color(0xFF446AEF)) : null, color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsetsGeometry.only(bottom: 20), child: SvgPicture.asset('assets/icons/arrow_down.svg')),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Almaty, Kabanbai Batyr 87', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          SizedBox(height: 6),
                          Text('Shymkent, Shagabutdinov 109', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          Text('Код заказа: X4R7B9P2', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFA1A1A1))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(color: orderType.color, borderRadius: BorderRadius.circular(20)),
                child: Text(orderType.label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 4),

          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 0.5,
            minHeight: 5,
            backgroundColor: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(11),
            valueColor: AlwaysStoppedAnimation<Color>(orderType.color),
          ),
          const SizedBox(height: 13),
          if (orderType == OrderType.processing) const OrderInformationProcessingType() else const OrderInformation(),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child:
                isSelected
                    ? OrderHistoryMoreInformation(onTap: orderType == OrderType.delivered ? () {} : null, buttonTitle: orderType == OrderType.delivered ? "Удалить" : null)
                    : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class OrderInformation extends StatelessWidget {
  const OrderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Получатель', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text('Абзал ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Отправлен', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text("12.43.444", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Объем', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text('20x100 см', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}