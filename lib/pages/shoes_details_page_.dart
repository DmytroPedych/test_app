import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_test_app/components/cart_.dart';
import 'package:shoes_test_app/components/catalogue_data_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/widgets_helper_.dart';
import 'package:shoes_test_app/pages/cart_page_.dart';
import 'package:shoes_test_app/theme/theme.dart';
import 'package:badges/badges.dart' as badges;
// const List<Widget> sizes = <Widget>[
//   Text('37'),
//   Text('38'),
//   Text('39'),
//   Text('40'),
//   Text('41'),
//   Text('42'),
//   Text('43'),
// ];

class ShoesDetailsPage extends StatefulWidget {
  final ShoesCatalogue2 shoe;
  const ShoesDetailsPage({super.key, required this.shoe});

  @override
  State<ShoesDetailsPage> createState() => _ShoesDetailsPageState();
}

class _ShoesDetailsPageState extends State<ShoesDetailsPage> {
  // arrow back icon
  buttonArrow() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: detailsPageColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: detailsPageColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 5,
                      width: 50 * 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.shoe.brand,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300]),
                        ),
                        Text(
                          widget.shoe.price,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(6),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoe.title,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Divider(
                      thickness: 0,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translation(context).details,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: 63,
                              height: 1,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      widget.shoe.description,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  addVerticalSpace(50),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurple.shade900,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all(const Size(300, 80)),
                      ),
                      onPressed: () {
                        context.read<Cart>().addItemToThecart(widget.shoe);
                        //_____________________________________________________snackbar
                        final snackBar = SnackBar(
                          showCloseIcon: true,
                          // duration: Duration(seconds: 8),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: Colors.green.shade600,
                          content: Center(
                            child: Text(
                              translation(context).add_to_cart_snackBar,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        translation(context).add_to_cart_button,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buttonCart() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 350),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage_();
              },
            ),
          );
        },
        child: badges.Badge(
          badgeContent: Text(context.watch<Cart>().count.toString()),
          child: const Icon(
            Icons.shopping_cart,
            size: 35,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(widget.shoe.imgUrl),
            ),
            buttonArrow(),
            buttonCart(),
            scroll(),
          ],
        ),
      ),
    );
  }
}
