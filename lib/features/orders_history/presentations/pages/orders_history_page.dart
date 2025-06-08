import 'package:delivery_client/features/orders_history/widgets/orders_history_type_button.dart';
import 'package:delivery_client/features/orders_history/widgets/orders_history_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


enum OrderType { processing, shipped, inTransit, delivered }

extension OrderTypeExtension on OrderType {
  Color get color {
    switch (this) {
      case OrderType.processing:
        return const Color(0xFFFFAB00);
      case OrderType.shipped:
        return const Color(0xFF40C4FF);
      case OrderType.inTransit:
        return const Color(0xFFAEEA00);
      case OrderType.delivered:
        return const Color(0xFF64DD17);
    }
  }

  String get label {
    switch (this) {
      case OrderType.processing:
        return 'Обработка';
      case OrderType.shipped:
        return 'Отправлен';
      case OrderType.inTransit:
        return 'В пути';
      case OrderType.delivered:
        return 'Выдан';
    }
  }
}

int selectedIndex = -1;

class OrdersHistoryPage extends StatefulWidget {
  const OrdersHistoryPage({super.key});

  @override
  State<OrdersHistoryPage> createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    _tabController?.addListener(_handleTabIndexChange);
  }

  void _handleTabIndexChange() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabIndexChange);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                // Просто текст, без Expanded и SizedBox
                Text('История заказов', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                Spacer(),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    context.pop();
                  },
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(color: Color(0xFFeff0fa), border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                    child: Center(child: SvgPicture.asset('assets/icons/repost.svg')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            TabBar(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              labelPadding: EdgeInsets.only(right: 8),
              padding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
              indicator: const BoxDecoration(),
              dividerColor: Colors.transparent,
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(child: OrdersHistoryTypeButton(isCurrent: _tabController?.index == 0, title: "Все")),
                Tab(child: OrdersHistoryTypeButton(isCurrent: _tabController?.index == 1, title: "Обработка")),
                Tab(child: OrdersHistoryTypeButton(isCurrent: _tabController?.index == 2, title: "Отправлен")),
                Tab(child: OrdersHistoryTypeButton(isCurrent: _tabController?.index == 3, title: 'В пути')),
                Tab(child: OrdersHistoryTypeButton(isCurrent: _tabController?.index == 4, title: 'Выдан')),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: OrderType.values.length,
                itemBuilder: (context, index) {
                  final orderType = OrderType.values[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex != -1) {
                          selectedIndex = -1;
                          return;
                        }
                        selectedIndex = index;
                      });
                    },
                    child: OrdersHistoryWidget(isSelected: selectedIndex == index, orderType: orderType),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






