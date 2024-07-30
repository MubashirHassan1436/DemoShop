import 'package:demo_shop/app_theme/app_color.dart';
import 'package:demo_shop/widgets/extentions.dart';
import 'package:flutter/material.dart';

import '../data_model/product.dart';
import 'title_text.dart';


class ProductCard extends StatelessWidget {
  final Product? product;
  final ValueChanged<Product>? onSelected;
  const ProductCard({super.key, this.product, this.onSelected});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xff080808), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: (product?.isSelected??false) ? 20 : 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  (product?.isliked??false) ? Icons.favorite : Icons.favorite_border,
                  color:
                  (product?.isliked??false) ? AppColors.red : Colors.black54,
                ),
                onPressed: () {
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: (product?.isSelected??false) ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.orange.withAlpha(80),
                      ),
                      Image.asset(product?.image??"",height: 90)
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product?.name??"",
                  fontSize: (product?.isSelected??false) ? 16 : 14,
                  color: Colors.black,
                ),
                TitleText(
                  text: product?.category??"",
                  fontSize: (product?.isSelected??false) ? 14 : 12,
                  color: AppColors.orange,
                ),
                TitleText(
                  text: (product?.price??0).toString(),
                  fontSize: (product?.isSelected??false) ? 18 : 16,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        if(onSelected!=null && product!=null){
          onSelected!(product!);
        }
      }, borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
