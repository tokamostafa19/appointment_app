import 'package:flutter/material.dart';
import 'package:appointment_app/manager/colormanager.dart';

import '../widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, $username',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'How are you feeling today?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorManager.Bluecolor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorManager.Bluecolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  'Find a doctor',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Book an appointment with the doctor you need.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                  ),
                                ),

                                SizedBox(height: 15),

                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: ColorManager.Bluecolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Find Doctor',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 100),
                        ],
                      ),
                    ),

                    Positioned(
                      right: -70,
                      top: -122,
                      child: Image.asset(
                        'assets/47629082c1e87efd4f845d79f79a60db33f33766.png',
                        width: 300,
                        height: 400,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                CategoryList(),

                SizedBox(height: 30),

                Text(
                  'Upcoming Appointment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8FA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: 28,
                        backgroundColor: ColorManager.Bluecolor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'No upcoming appointment',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Book your next appointment',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(IconData icon, String title) {
    return Column(
      children: [

        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xffF2F8F8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: ColorManager.Bluecolor,
            size: 28,
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