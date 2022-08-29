import 'package:flutter/material.dart';
import 'package:provider_app/DatabaseServices/Moviedb.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/screens/Ready.dart';

class Startup extends StatefulWidget {
  String Moviekey;
  AllMovies allMovies;
  Startup({required this.Moviekey, required this.allMovies});

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadAllMovies();
  }

  late List<Movie> AllYogaWorkOuts;
  bool isLoading = true;
  Future ReadAllMovies() async {
    this.AllYogaWorkOuts = await MoviesDatabase.instance
        .readAllMovie(widget.allMovies.MovieKey_all);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ready(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "Start",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            // backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("Movies"),
              background: Image.network(
                "https://th.bing.com/th/id/OIP.d3IiScFL5U_vKIJfvekbFQHaEK?pid=ImgDet&rs=1",
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up_alt_rounded),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("60 Mins || 5 Short Movies"),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                      itemBuilder: (context, index) => ListTile(
                            title: Text(
                              "Movie $index",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            subtitle: Text((index % 2 == 0) ? "00:30" : "x30",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                            leading: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Image.network(
                                "https://media4.giphy.com/media/b8RfbQFaOs1rO10ren/200.webp",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      itemCount: 9)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
