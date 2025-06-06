import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFFf4f5ff),
      body: SafeArea(
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
      ),
    );
  }
}

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

class OrderInformationProcessingType extends StatelessWidget {
  const OrderInformationProcessingType({super.key});

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
                Text('Объем', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text("20x100 см", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.scaleDown,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFFF564A))),
                child: Text('Отменить заказ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFF564A))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
                SvgPicture.asset('assets/icons/phone.svg'),
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

class OrdersHistoryTypeButton extends StatelessWidget {
  final bool isCurrent;
  final String title;
  const OrdersHistoryTypeButton({super.key, required this.isCurrent, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: isCurrent ? mainColor : Color(0xFFeff0fa)),
      child: Text(title, style: TextStyle(color: isCurrent ? Colors.white : Color(0xFFA1A1A1), fontSize: 14, fontWeight: FontWeight.w400)),
    );
  }
}
