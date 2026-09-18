import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          categoryItem(
            'assets/categoryList/a0fea4bcf76e008e0de983728f913f0d8b4d837c.png',
            'General',
          ),

          SizedBox(width: 20),

          categoryItem(
            'assets/categoryList/6d335312ac0fcea2f0f63ff7162bf02fd023e8f7.png',
            'Neurologic',
          ),

          SizedBox(width: 20),

          categoryItem(
            'assets/categoryList/edd3282bde4392d78ee6cb957afb2674f9d6b767.png',
            'Pediatric',
          ),

          SizedBox(width: 20),

          categoryItem(
            'assets/categoryList/a8d47cc4c28a433ff517271dbace74fb141a3370.png',
            'Radiology',
          ),
        ],
      ),
    );
  }

  Widget categoryItem(String image, String title) {
    return Column(
      children: [

        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xffF2F8F8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              image,
              width: 10,
              height: 10,
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(height: 8),

        Text(
          title,
          style: TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}