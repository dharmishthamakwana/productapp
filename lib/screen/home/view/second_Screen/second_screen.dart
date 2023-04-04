import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Product_provider/product_provider.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int? i;

  ProductProvider? homeProviderTrue;
  ProductProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    i = ModalRoute.of(context)!.settings.arguments as int;
    homeProviderTrue = Provider.of<ProductProvider>(context, listen: true);
    homeProviderFalse = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${homeProviderFalse!.apiList[i!].category}"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white70,
              child: Image.network(
                "${homeProviderFalse!.apiList[i!].image}",
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('${homeProviderFalse!.apiList[i!].title}',
                                style: TextStyle(color: Colors.black)),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Price : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    Text(
                                      "\$${homeProviderFalse!.apiList[i!].price}  ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Id  :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    Text(
                                      "\$${homeProviderFalse!.apiList[i!].price}  ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "description : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    Text(
                                      "${homeProviderFalse!.apiList[i!].description}  ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
