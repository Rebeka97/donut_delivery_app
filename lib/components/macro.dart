import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String title;
  final int? value;
  final FaIconData icon;
  
  const MyMacroWidget({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 2),
                          blurRadius: 5,
                          color: Colors.grey.shade400,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          FaIcon(
                            icon,
                            color: const Color.fromARGB(255, 75, 184, 227),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            value == null
                                ? 'N/A $title'
                                : title == "Calories"
                                    ? '$value $title'
                                    : '($value)g $title',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],)
                    ),
                  ),
              );
  }
}