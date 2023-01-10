import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/colors.dart';
import '../widgets/bidding_item.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        padding: const EdgeInsets.only(
          top: 150,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('auctions')
                  .doc('7')
                  .collection('biddings')
                  .orderBy('amount', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                var value = snapshot.data!.docs
                    .asMap()
                    .map((key, value) => MapEntry(key, value))
                    .values
                    .toList();
                return Text(
                  value.first['amount'].toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MyColors.red,
                    fontSize: 16,
                  ),
                );
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('auctions')
                    .doc('7')
                    .collection('biddings')
                    .orderBy('amount', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'an error occured'.tr,
                    );
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        children: snapshot.data!.docs
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                key,
                                BiddingItem(
                                  name: value['name'],
                                  image: value['image'],
                                  amount: (value['amount']).toString(),
                                  order: (key + 1),
                                  isLast: key + 1 == snapshot.data!.docs.length,
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      );
                  }
                },
              ),
            ),
          ],
        ),

        // child: FirestoreListView<FireStoreBiddingModel>(
        //   shrinkWrap: true,
        //   query: query,
        //   itemBuilder: (context, snapshot) {
        //
        //     return BiddingItem(
        //         name: snapshot.data().name,
        //         image: snapshot.data().image,
        //         amount: snapshot.data().amount.toString(),
        //         order: '1');
        //   },
        // ),
      ),
    );
  }
}
