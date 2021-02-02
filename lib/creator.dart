import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Creator extends StatefulWidget {
  @override
  _CreatorState createState() => _CreatorState();
}

class _CreatorState extends State<Creator> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/video.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                  "images/nirmit_appbar.jpg",
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              color: Colors.blueGrey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.blueGrey[900],
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('images/nirmir.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'Nirmit Sawant',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Trying Stuff Out',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.blueGrey[700],
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.blueGrey[900],
                          ),
                          title: Text(
                            '+91 9870******',
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.blueGrey[900],
                          ),
                          title: Text(
                            'sawantnirmit@gmail.com',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
