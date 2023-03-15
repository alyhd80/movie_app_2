import 'package:flutter/material.dart';
import 'package:movie_app/theme/theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: backgroundcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _CustomIcon(icon: Icons.stars, text: "89%"),
                  _CustomIcon(icon: Icons.tv, text: "Netflix"),
                  _CustomIcon(icon: Icons.stars, text: "Tv +14"),
                  _CustomIcon(icon: Icons.av_timer_rounded, text: "50m"),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'When a young boy disappears, his mother, a police chief, and his friend must confront terrifying forces in order to get him back.',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 10),
                child: Text(
                  "Related shows",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          height: size.height * .18,
                          width: size.width * .23,
                          image: AssetImage(
                            "assets/images/related00${index + 1}.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Seansons",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              _Features(
                  size: size,
                  colorLine: Colors.red.shade300,
                  title: "Seanson 1",
                  subtitle: "8 watched"),

              _Features(
                  size: size,
                  colorLine: Colors.red.shade300,
                  title: "Seanson 2",
                  subtitle: "9 watched"),

              _Features(
                  size: size,
                  colorLine: Colors.red.shade300,
                  title: "Seanson 3",
                  subtitle: "1 to air"),

              _Features(
                  size: size,
                  colorLine: Colors.red.shade300,
                  title: "Special",
                  subtitle: "7 to watch"),




            ],
          )
        ],
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CustomIcon({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

class _Features extends StatelessWidget {
  final Size size;
  final String title;
  final String subtitle;
  final Color colorLine;

  const _Features(
      {Key? key,
      required this.size,
      required this.colorLine,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      color: backgroundcolor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 5,
                  color: colorLine,
                ),
              ),
              Icon(
                Icons.padding,
                color: Colors.grey[400],
              )
            ],
          ))
        ],
      ),
    );
  }
}
