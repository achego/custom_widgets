import 'dart:developer';

import 'package:flutter/material.dart';

class CustomSliverAppbar extends StatelessWidget {
  CustomSliverAppbar({super.key});

  final musicList = [
    Music(
      title: 'Pretty Girl - Cheat Codes x CADE',
      artist: 'Margie landlady, Cheat codes',
      isFav: true,
    ),
    Music(
      title: 'We Cry Together',
      artist: 'Kendric Lamar, Tailor Page',
    ),
    Music(
      title: "Where's My Love",
      artist: 'SMLK',
      isFav: true,
      isPlaying: true,
    ),
    Music(
      title: 'Kwaku the Traveller',
      artist: 'Black Sherif',
      isFav: true,
    ),
    Music(
      title: 'Silence',
      artist: 'Marshmello, Khalid',
    ),
    Music(
      title: '7 minutes',
      artist: 'Dean Lewis',
    ),
    Music(
      title: '7 minutes',
      artist: 'Dean Lewis',
    ),
    Music(
      title: '7 minutes',
      artist: 'Dean Lewis',
    ),
    Music(
      title: '7 minutes',
      artist: 'Dean Lewis',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final playingMusic = musicList.where((music) => music.isPlaying).first;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded),
              label: 'Music Library'),
        ],
        backgroundColor: Colors.black,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 9),
        unselectedLabelStyle: const TextStyle(fontSize: 9),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBbar(expandedHeight: 300),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: musicList.length + 1,
                    (_, pos) {
                      if (pos == 0) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20, bottom: 30),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 128, 255, 132),
                            ),
                            child: const Icon(
                              Icons.arrow_downward_sharp,
                              size: 16,
                            ),
                          ),
                        );
                      }
                      final music = musicList[pos - 1];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Container(
                            height: 56,
                            width: 56,
                            color: Colors.grey,
                          ),
                          title: Text(
                            music.title,
                            style: TextStyle(
                              color: music.isPlaying
                                  ? const Color.fromARGB(255, 128, 255, 132)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            children: [
                              Container(
                                height: 13,
                                width: 13,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 128, 255, 132),
                                ),
                                child: const Icon(
                                  Icons.arrow_downward,
                                  size: 10,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'LYRICS',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Text(
                                  'F',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  music.artist,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: music.isFav
                                    ? const Color.fromARGB(255, 128, 255, 132)
                                    : Colors.grey,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.more_vert_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 92, 92, 92),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          const SizedBox(width: 7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                playingMusic.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                playingMusic.artist,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 9),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.speaker_group_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 128, 255, 132),
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Colors.white,
                        Color.fromARGB(255, 161, 161, 161)
                      ], stops: [
                        0.5,
                        0.5
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverAppBbar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBbar({required this.expandedHeight});

  final double playheight = 60;
  double stausBarHeight = 10;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    stausBarHeight = MediaQuery.of(context).viewPadding.vertical;
    log((shrinkOffset / (expandedHeight / 5)).toString());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [
                        Color.fromARGB(255, 132, 41, 218),
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        (shrinkOffset / expandedHeight) * 1.3 >= 0.65
                            ? (shrinkOffset / expandedHeight) * 1.3
                            : 0.65,
                        1
                      ])),
            ),

            // Title, leading and actions and search bar
            Positioned(
              top: stausBarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title, leading and actions
                  Container(
                    height: kToolbarHeight,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  // if (shrinkOffset <= expandedHeight / 5)
                  Opacity(
                    opacity: (shrinkOffset / (expandedHeight / 4)) >= 1
                        ? 0
                        : 1 - (shrinkOffset / (expandedHeight / 4)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white.withOpacity(0.3),
                                  hintText: 'Find in liked songs',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                )),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3)),
                            child: const Text(
                              'Sort',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        Positioned(
            bottom: 10,
            left: 15,
            child: Opacity(
              opacity: (shrinkOffset / (expandedHeight / 2)) >= 1
                  ? 0
                  : 1 - (shrinkOffset / (expandedHeight / 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Liked Songs',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '266 songs',
                    style: TextStyle(
                        color: Color.fromARGB(255, 223, 223, 223),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ],
              ),
            )),

        // Play Button
        Positioned(
          bottom: -playheight / 2,
          right: 10,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: playheight,
                width: playheight,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 255, 132),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Positioned(
                bottom: -2,
                right: 4,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.shuffle_rounded,
                      color: Color.fromARGB(255, 128, 255, 132),
                      size: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + stausBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class Music {
  final String title;
  final String artist;
  final bool isFav;
  final bool isPlaying;

  Music({
    required this.title,
    required this.artist,
    this.isFav = false,
    this.isPlaying = false,
  });
}
