import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/firestore_bidding/firestore_bidding_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/bidding_item.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  static final Query<FireStoreBiddingModel> query = FirebaseFirestore.instance
      .collection('auctions')
      .doc('7')
      .collection('biddings')
      .withConverter<FireStoreBiddingModel>(
        fromFirestore: (snapshot, _) {
          print(snapshot.data()!);
          print('helloooo');
          return FireStoreBiddingModel.fromJson(
            snapshot.data()!,
          );
        },
        toFirestore: (biddings, _) => biddings.toJson(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('auctions')
              .doc('7')
              .collection('biddings')
              .orderBy('amount', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
