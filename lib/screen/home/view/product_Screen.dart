import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_provider/product_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void getData()  {
     Provider.of<ProductProvider>(context, listen: false).apiCalling();
  }

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeProvider>(context,listen: false).apiCalling();
    getData();
  }

  ProductProvider? proTrue;
  ProductProvider? proFalse;

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<ProductProvider>(context, listen: false);
    proTrue = Provider.of<ProductProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product List"),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: proTrue!.apiList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail',
                          arguments: index);
                    },
                    contentPadding: EdgeInsets.all(10),

                    leading: Container(
                      height: 100,
                      width: 100,
                      child:
                          Image.network('${proTrue!.apiList[index].image}'),
                    ),

                    title: Text("${proTrue!.apiList[index].category}"),
                    subtitle: Text("\$ ${proTrue!.apiList[index].price}"),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
