import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text(
        'Best of Hindi',
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
    ),
    body: SpotifyPlayer(),
    backgroundColor: Colors.black,
  )));
}

class SpotifyPlayer extends StatefulWidget {
  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs =
      SongData().songs; // You are given a list of songs here for Stretch

  IconData playpause = Icons.play_circle_filled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image(
              image: NetworkImage(dummySong.imageUrl),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
          child: Container(
            child: Text(
              dummySong.name,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            alignment: Alignment.bottomLeft,
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 5.0),
            child: Container(
              child: Text(dummySong.artistName,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.6))),
              alignment: Alignment.topLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                ),
              ),
              IconButton(
                color: Colors.white,
                iconSize: 70,
                onPressed: () {
                  if (playpause == Icons.play_circle_filled) {
                    playpause = Icons.pause;
                    audioPlayer.play(dummySong.playUrl);
                  } else {
                    playpause = Icons.play_circle_filled;
                    audioPlayer.pause();
                  }
                  setState(() {});
//                setState(() {
//                  audioPlayer.play(dummySong.playUrl);
//                });
//                audioPlayer.play(dummySong.playUrl);
                },
                icon: Icon(playpause),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_next),
                color: Colors.white,
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  audioPlayer.pause();
                },
                icon: Icon(Icons.thumb_down),
              ),
            ],
          ),
        )
      ],
    );
  }
}
