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
      width: 250,
      height: 250,
      child: Column(
        children: [
          Container(
            height: 230,
            width: 230,
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
                strokeAlign: StrokeAlign.outside,
              ),
              // image: DecorationImage(
              //   image: CustomNetworkImage(
              //     image!,
              //   ).,
              //   fit: BoxFit.cover,
              // ),
            ),
            child: SizedBox(
              height: 230,
              width: 230,
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: image!,
                    radius: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(25)),
                        color: MyColors.primary,
                      ),
                      child: Text(
                        price!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          bottomRight : Radius.circular(25)),
                        color: Colors.white,
                      ),
                      child: Text(
                        //TODO: edit timer
                        price!,
                        style: TextStyle(
                          color: MyColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            name!,
            style: const TextStyle(
              color: MyColors.primary,
              fontSize: 20,
            ),
          ),
          Text(
            user!,
            style: const TextStyle(
              color: MyColors.greyText,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
