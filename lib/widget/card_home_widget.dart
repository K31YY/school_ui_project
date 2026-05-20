import 'package:flutter/material.dart';

class CardHomeWidget extends StatefulWidget {
  final String name;
  final String urlImage;
  // final List slideRowTitle;
  final bool isUrlNetwork;
  const CardHomeWidget({
    super.key,
    required this.name,
    required this.urlImage,
    // required this.slideRowTitle,
    this.isUrlNetwork = true,
  });

  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {
  final List<String> _slideRowTitle = [
    'Academic success',
    'Years List',
    'Subject',
    'Class',
  ];

  final List<IconData> _slideRowIcon = [
    Icons.abc,
    Icons.notification_add,
    Icons.abc_rounded,
    Icons.abc_sharp,
    Icons.ac_unit,
    Icons.ac_unit_outlined,
  ];

  final List<Color> _slideColor = [
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  final List<String> _grade = ['A-', '90-92', '3.7'];
  final String profileImage = 'assets/image/ken.png.png';
  final List<String> _bottomCardTitle = ['Letter Grade', 'Grade, %', 'GPA'];

  @override
  Widget build(BuildContext context) {
    return _buildCard;
  }

  get _buildCard => Column(
    children: [
      SizedBox(height: 88),
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentGeometry.topCenter,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 5,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '9th Grade',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    _slideRow,
                    _bottomCard,
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -35,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: widget.isUrlNetwork == true
                      ? NetworkImage(widget.urlImage)
                      : AssetImage(widget.urlImage),
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  get _slideRow => SingleChildScrollView(
    padding: EdgeInsets.only(left: 20),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        _slideRowTitle.length,
        (index) => Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(8),
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            spacing: 10,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: _slideColor[index],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_slideRowIcon[index], color: Colors.white),
              ),
              Text(
                _slideRowTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  get _bottomCard => Container(
    padding: EdgeInsets.all(25),
    height: 125,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3,
        (index) => Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _grade[index],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  _bottomCardTitle[index],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
