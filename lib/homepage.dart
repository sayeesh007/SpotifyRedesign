import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'My Playlist',
                  style: headStyle(),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        playList(
                            'assets/images/p1.png', 'Dark', 'Created Dec 2021'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        playList('assets/images/p2.png', 'My Mix',
                            'Created Jan 2021'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        playList('assets/images/p3.png', 'Latest',
                            'Created Dec 2021'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    button(0, 'EXPLORE'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(child: button(1, 'UPGRADE TO PREMIUM'))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '2020 Wrapped',
                  style: headStyle(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                card(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Recently Played',
                  style: headStyle(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      recents('assets/images/recent1.png', 'author'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recents('assets/images/recent2.png', 'author'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recents('assets/images/recent3.png', 'author'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recents('assets/images/recent3.png', 'author'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recents('assets/images/recent1.png', 'author'),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container appBar() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Chronovesta Musics',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(Icons.radio),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.settings)
        // SvgPicture.asset('assets/icons/radio.svg'),
        // SvgPicture.asset('assets/icons/settigns.svg'),
      ],
    ),
  );
}

TextStyle headStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle normalStyle() {
  return TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
}

Container playList(String path, String name, String desc) {
  return Container(
    width: 150,
    height: 150.0,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: 150,
            height: 150.0,
          ),
        ),
        Positioned(
          left: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: headStyle(),
              ),
              Text(
                desc,
                style: normalStyle(),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Container button(int i, String desc) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: i == 0 ? Colors.green : Colors.transparent,
        border:
            i == 0 ? Border() : Border.all(color: Colors.green, width: 2.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          desc,
          style: normalStyle(),
        ),
        i == 0
            ? SizedBox()
            : Icon(
                Icons.circle_notifications_rounded,
                color: Colors.green,
              )
      ],
    ),
  );
}

Container card() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.green,
    ),
    width: double.infinity,
    height: 125,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            'assets/images/popular1.png',
            width: 100.0,
            height: 100.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 230,
              height: 50,
              child: Text(
                'See Who you listned to in 2020',
                maxLines: 2,
                style: headStyle(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 230,
              height: 50,
              child: Text(
                'Your top artists, songs and Podcasts of the year',
                maxLines: 3,
                style: normalStyle(),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Container recents(String path, String name) {
  return Container(
    width: 100,
    height: 130.0,
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100.0,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          name,
          style: normalStyle(),
        ),
      ],
    ),
  );
}
