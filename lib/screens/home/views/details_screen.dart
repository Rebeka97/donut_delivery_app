import 'package:donut_repository/donut_repository.dart';
import 'package:flutter/material.dart';
import 'package:donuts_app/components/macro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final Donut donut;
  const DetailsScreen({super.key, required this.donut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        children: [
          Container (
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width - (40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 5
                )
              ],
              image: DecorationImage(
                image: NetworkImage(donut.picture))
            ),
          ),
          SizedBox(height: 30),
          Container (
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 5
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
    child: Column(
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Expanded(
                    flex:2,
                    child: Text(donut.name,
                   style: TextStyle(
                     fontFamily: 'PoiretOne',
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (donut.discount == 0)
                          Text(
                            '\$${donut.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 252, 109, 169),
                            ),
                          )
                        else ...[
                          Text(
                            '\$${(donut.price - donut.discount).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 252, 109, 169),
                            ),
                          ),
                          Text(
                            '\$${donut.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    ),
                  ),
                 ],
               ),
                const SizedBox(height: 12),
                Row(
                  children: [
                  MyMacroWidget(
                    title: 'Calories',
                    value: donut.macros.calories,
                    icon: FontAwesomeIcons.fire,
                  ),
                  const SizedBox(width: 10),
                  MyMacroWidget(
                    title: 'Protein',
                    value: donut.macros.protein,
                    icon: FontAwesomeIcons.dumbbell,
                  ),
                  const SizedBox(width: 10),
                  MyMacroWidget(
                    title: 'Carbs',
                    value: donut.macros.carbs,
                    icon: FontAwesomeIcons.breadSlice,
                  ),
                  const SizedBox(width: 10),
                  MyMacroWidget(
                    title: 'Fat',
                    value: donut.macros.fat,
                    icon: FontAwesomeIcons.oilWell,
                  ),
                ],),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                     style: TextButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: const Color.fromARGB(255, 252, 109, 169),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    child: Text('Buy Now',
                     style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                  ),
                ), // Closing Row
              ], // Closing Column
            ), // Closing Container
            ),
          ),
        ],
        ),
      ),
    );
  }
}