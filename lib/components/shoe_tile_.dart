import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/catalogue_data_.dart';

class ShoeTile extends StatelessWidget {
  final ShoesCatalogue2 shoe;
  final void Function()? onTap;
  const ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey.shade500 : Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //___________________________shoe pic
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.grey.shade400
                      : Colors.grey.withOpacity(0.7),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                shoe.imgUrl,
                width: 300,
              ),
            ),
          ),
          //_______________________________ shoe price
          Text(
            shoe.price,
            style: TextStyle(
              color: isDark ? Colors.grey[400] : Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          //____________________________________brand
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    //_________________________________________shoe brand
                    Text(
                      shoe.brand,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isDark ? Colors.grey[100] : Colors.grey[800]),
                    ),
                    // ______________________________________-shoe title
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      shoe.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? Colors.grey[200] : Colors.grey[800],
                      ),
                    ),
                  ],
                ), //_______________________________________button add to cart)
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
