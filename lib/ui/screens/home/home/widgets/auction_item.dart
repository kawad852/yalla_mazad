import 'package:flutter/material.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';

import '../../../../../utils/colors.dart';

class AuctionItem extends StatelessWidget {
  final String? image;
  final String? name;
  final String? user;
  final String? price;
  const AuctionItem(
      {required this.image,
      required this.name,
      required this.user,
      required this.price,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25,
              ),
              border: Border.all(
                color: const Color.fromRGBO(
                  228,
                  225,
                  232,
                  1,
                ),
                width: 7,
                strokeAlign: StrokeAlign.inside,
              ),
              // image: DecorationImage(
              //   image: CustomNetworkImage(
              //     image!,
              //   ).,
              //   fit: BoxFit.cover,
              // ),
            ),
            child: SizedBox(
              height: 190,
              width: 190,
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: image!,
                    radius: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 72,
                      height: 23,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(25)),
                        color: MyColors.primary,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            price!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 72,
                      height: 23,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            //TODO: edit timer
                            price!,
                            style: const TextStyle(
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              name!,
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              user!,
              style: const TextStyle(
                color: MyColors.greyText,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
