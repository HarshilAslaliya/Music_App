import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/modals/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isPlay = false;
  Duration? totalDuration;

  openAudio() async {
    for (Map<String, dynamic> songData in musicList) {
      await songData['player'].open(
        Audio(
          songData['song'],
          metas: Metas(
            title: songData['song_name'],
            album: songData['song'],
            image: const MetasImage.asset('assets/images/goosebumps.jpeg'),
          ),
        ),
        autoStart: false,
        showNotification: true,
        notificationSettings: NotificationSettings(
            customPlayPauseAction: (AssetsAudioPlayer audioPlayer) {
          late int id;

          for (Map<String, dynamic> songData in musicList) {
            if (songData['player'] == audioPlayer) {
              id = musicList.indexOf(songData);
            }
          }
        }),
      );
    }

    for (Map<String, dynamic> songData in musicList) {
      setState(() {
        songData['total_duration'] =
            songData['player'].current.value!.audio.duration;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    openAudio();
  }

  @override
  void dispose() {
    super.dispose();
    openAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              enabled: true,
                              filled: true,
                              focusedBorder: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 28,
                              ),
                              hintText: 'Find the music',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              hintStyle:
                                  const TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Sort',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.white38,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0)
                      ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/hanumanchalisa.jpeg'),
                                  ),
                                ),
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/shivatheme.jpeg'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/undertheinfluence.jpeg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/deva.jpeg'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Harshil',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        CupertinoIcons.globe,
                        color: Colors.grey,
                        size: 28,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '2h 15m',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_add_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: CupertinoColors.systemGreen,
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 40,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.365,
                    width: MediaQuery.of(context).size.width * 01,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: musicList.length,
                      itemBuilder: (context, i) => Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: MediaQuery.of(context).size.width * 01,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: musicList[i]['images'],
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      musicList[i]['song_name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      musicList[i]['created_by'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.46,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon:
                                                const Icon(Icons.play_arrow),
                                            onPressed: () async {
                                              await musicList[i]['player']
                                                  .play();
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.pause),
                                            onPressed: () async {
                                              await musicList[i]['player']
                                                  .pause();
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.stop),
                                            onPressed: () async {
                                              await musicList[i]['player']
                                                  .stop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.075,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.53,
                                      child: StreamBuilder(
                                        stream: musicList[i]['player']
                                            .currentPosition,
                                        builder: (context,
                                            AsyncSnapshot<Duration>
                                                snapshot) {
                                          Duration? currentPosition =
                                              snapshot.data;

                                          return Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "${"$currentPosition".split(".")[0]}/${"${musicList[i]['total_duration']}".split(".")[0]}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Slider(
                                                    activeColor:
                                                        CupertinoColors
                                                            .systemGreen,
                                                    inactiveColor:
                                                        Colors.green.shade200,
                                                    min: 0,
                                                    max: musicList[i]
                                                            ['total_duration']
                                                        .inSeconds
                                                        .toDouble(),
                                                    value: (currentPosition !=
                                                            null)
                                                        ? currentPosition
                                                            .inSeconds
                                                            .toDouble()
                                                        : 0,
                                                    onChanged: (val) async {
                                                      await musicList[i]
                                                              ['player']
                                                          .seek(Duration(
                                                              seconds: val
                                                                  .toInt()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
