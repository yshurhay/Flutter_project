import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String globalName;

class MySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CONCERTS 2020-2021"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Image.network("https://images.genius.com/3c82c3df151f665e72264a23375b26a0.1000x1000x1.jpg"),
                        ),
                      ),
                    ]
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network("https://avatars.yandex.net/get-music-content/2397565/f39294b4.a.11874284-1/200x200"),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network("https://the-flow.ru/uploads/images/catalog/element/5ea8679ee0414.jpg"),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network("https://the-flow.ru/uploads/images/catalog/element/5fada4b2eb893.jpg"),
                        ),
                      ),
                    ]
                ),
              ]
          ),
        ],
      ),
    );
  }
}

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(globalName),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ListArtistData.getConcerts(globalName).length + 1,
          itemBuilder: (BuildContext context, int index)
          {
            if(index == 0)
            {
              return Container(
                width: 200,
                height: 200,
                child: Image.network(ListArtistData.getImage(globalName)),
              );
            }
            return Container(
              padding: EdgeInsets.all(20),
              child: Text(ListArtistData.getConcerts(globalName)[index - 1]),
            );
          },
        ),
      ),
    );
  }
}

class ArtistData {
  String name;
  List<String> concerts = [];
  String image;

  ArtistData(this.name, this.concerts, this.image);

}

class ListArtistData {
  static List<ArtistData> artistList = new List();

  static void add(ArtistData artist)
  {
    artistList.add(artist);
  }

  static List<String> getConcerts(String name)
  {
    for(ArtistData item in artistList)
    {
      if(item.name == name)
        return item.concerts;
    }
  }

  static String getImage(String name)
  {
    for(ArtistData item in artistList)
    {
      if (item.name == name)
        return item.image;
    }
  }

  static List<String> getNames()
  {
    List<String> namesList = new List();
    for (ArtistData item in artistList)
    {
      if (!namesList.contains(item.name))
        namesList.add(item.name);
    }

    return namesList;
  }
}

class DataSearch extends SearchDelegate<String> {

  void createArtistList()
  {
    for (int i=0; i < artists.length; i++)
    {
      ListArtistData.artistList.add(ArtistData(artists[i], concerts[i], albums[i]));
    }
  }

  final artists = [
    "May Waves",
    "Pharaoh",
    "Obladaet",
    "Jeembo",
    "T-Fest",
    "Markul",
    "Lil Krystalll",
    "Skryptonite",
    "LSP",
    "Feduk",
  ];

  final concerts = [
    ["21 may 2021\nSaint Petersburg\nKosmonavt\n20:00", "26 may 2021\nMoscow\nGlavclub\n20:00", "1 apr 2021\nMoscow\nMusic Media Dome\n21:00"],
    ["21 mar 2021\nVladivostok\nCraft\n20:00", "23 mar 2021\nIrkutsk\nDorenberg\n20:00", "23 apr 2021\nSaint Petersburg\nA2 Green Concert\n20:00"],
    ["10 apr 2021\nMoscow\nMusic Media Dome\n20:00","1 may 2021\nSaint Petersburg\nA2 Green Concert\n20:00","21 may 2021\nSaint Petersburg\nYubileyny\n20:00"],
    ["22 feb 2021\nMoscow\nArena by Soho Family\n23:00", "4 apr 2021\nPetrozavodsk\nSolo\n20:00", "17 apr 2021\nVoronezh\nArena Hall\n18:00"],
    ["27 feb 2021\nMoscow\nAdrenaline Stadium\n20:00", "15 may 2021\nSaint Petersburg\nA2 Green Concert\n20:00"],
    ["21 may 2021\nSaint Petersburg\nYubileyny\n20:00"],
    ["7 feb 2021\nSaint Petersburg\nKosmonavt\n20:00", "5 mar 2021\nMinsk\nHide\n20:00"],
    ["17 apr 2021\nNur-Sultan\nKongress-center\n20:00", "22 may 2021\nAlmaty\nDvorec Sporta\n20:00"],
    ["18 feb 2021\nRostov on Don\nArena Hall\n21:00", "19 feb 2021\nVoronezh\nPalazzo\n20:00"],
    ["16 apr 2021\nMoscow\nAdrenaline Stadium\n20:00", "30 apr 2021\nSaint Petersburg\nA2 Green Concert\n20:00"],
  ];

  final albums = [
    "https://the-flow.ru/uploads/images/catalog/element/5bec3e6bc6a60.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5e971f3c39e96.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5db2128f6c937.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5f19fc63e9c4b.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5b5a15258b4c1.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5bc58ed1cbb69.jpg",
    "https://images.genius.com/464ca9d8c9f4f713dd0f4ebd9a2da820.1000x1000x1.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5e01a1093e704.jpg",
    "https://m.the-flow.ru/uploads/images/origin/01/75/04/63/00/b3c0898.jpg",
    "https://the-flow.ru/uploads/images/catalog/element/5fa5074838d41.jpg",
  ];

  List<String> recentArtists = [
    "LSP",
    "Feduk",
    "May Waves",
    "Obladaet",
    "Lil Krystalll",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    createArtistList();

    final suggestionList = query.isEmpty ? recentArtists : ListArtistData.getNames().where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          globalName = suggestionList[index];
          query = suggestionList[index];
          //showResults(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArtistPage()),
          );
        },
        leading: Icon(Icons.portrait),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Image.network("https://st4.depositphotos.com/14051716/20455/v/600/depositphotos_204553792-stock-video-sad-smile-face-symbol-seamless.jpg"),
                        ),
                      ),
                    ]
                ),
                SizedBox(
                  height: 190,
                ),
                Center(
                  child: Text(
                      '    no concerts\nin the near future',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.white)),
                ),
              ]
          ),
        ],
      ),
    );

  }
}

