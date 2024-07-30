import 'package:demo_shop/app_theme/app_color.dart';
import 'package:demo_shop/data_model/shop_info.dart';
import 'package:demo_shop/widgets/extentions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app_theme/theme.dart';
import '../widgets/product_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/product_icon.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _icon(IconData icon, {Color color = AppColors.iconColor}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: Colors.white,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ShopInfo.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 2),
              child: SlideAnimation(
                horizontalOffset: 200.0,
                child: FadeInAnimation(
                  child: ProductIcon(
                    model: ShopInfo.categoryList[index],
                    onSelected: (model) {
                      setState(() {
                        for (var item in ShopInfo.categoryList) {
                          item.isSelected = false;
                        }
                        model.isSelected = true;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: ShopInfo.categoryList
      //       .map(
      //         (category) => ProductIcon(
      //           model: category,
      //           onSelected: (model) {
      //             setState(() {
      //               for (var item in ShopInfo.categoryList) {
      //                 item.isSelected = false;
      //               }
      //               model.isSelected = true;
      //             });
      //           },
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: ShopInfo.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  setState(() {
                    for (var item in ShopInfo.productList) {
                      item.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 210,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _search(),
            _categoryWidget(),
            _productWidget(),
          ],
        ),
      ),
    );
  }
}
