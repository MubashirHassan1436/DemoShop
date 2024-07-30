import 'package:demo_shop/app_theme/app_color.dart';
import 'package:demo_shop/widgets/extentions.dart';
import 'package:flutter/material.dart';

import '../app_theme/theme.dart';
import '../data_model/category.dart';
import 'title_text.dart';


class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;
  const ProductIcon({super.key, required this.model, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: model.isSelected??false
                    ? AppColors.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected??false ? AppColors.orange : AppColors.grey,
                  width: model.isSelected??false ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected??false ? const Color(0xff0b020f) : Colors.black,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.image != null ? Image.asset(model.image??"",width: 40.0,) : const SizedBox(),
                  const SizedBox(width: 8.0,),
                  model.name == null
                      ? const SizedBox()
                      : TitleText(
                        text: model.name??"",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
