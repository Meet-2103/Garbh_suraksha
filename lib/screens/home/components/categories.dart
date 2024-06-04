import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_assistant/screens/hospital_forms/formScreen.dart';
import 'package:hospital_assistant/screens/hospital_forms/formScreen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Appointment"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Form"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Reminder"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "kick count"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            categories.length,
            (index) => Row(
              children: [
                CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {
                    Navigator.pushNamed(context, FormScreen.routeName);
                  },
                ),
                SizedBox(width: 30,)
              ],
            ),
          ),

        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
