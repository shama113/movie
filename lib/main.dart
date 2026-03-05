import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: HomePage(),
    );
  }
}

class Movie {
  final String title;
  final String image;
  final String description;
  final double rating;

  Movie({
    required this.title,
    required this.image,
    required this.description,
    this.rating = 4.5,
  });
}

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Начало",
      image: "https://picsum.photos/200/300?1",
      description:
          "Доминек Кобб — опытный вор, который крадет секреты из подсознания во время сна. Ему предлагают невероятно опасное задание — не украсть информацию, а внедрить идею в мозг человека. Фильм показывает грань между реальностью и миром снов и задает вопросы о природе сознания.",
      rating: 4.8,
    ),
    Movie(
      title: "Интерстеллар",
      image: "https://picsum.photos/200/300?2",
      description:
          "Группа исследователей отправляется в космическую миссию через червоточину, чтобы найти новую планету, где человечество сможет выжить. Фильм рассказывает о путешествиях во времени, любви и жертвах, необходимых ради спасения всего человечества.",
      rating: 4.7,
    ),
    Movie(
      title: "Тёмный рыцарь",
      image: "https://picsum.photos/200/300?3",
      description:
          "Бэтмен продолжает бороться с преступностью в Готэме, сталкиваясь с новым опасным противником — Джокером. Фильм исследует моральные дилеммы, хаос и порядок, а также личную цену борьбы за справедливость.",
      rating: 4.9,
    ),
    Movie(
      title: "Матрица",
      image: "https://picsum.photos/200/300?4",
      description:
          "Нео — обычный программист, который узнает, что весь мир вокруг него — компьютерная симуляция. Он присоединяется к сопротивлению, чтобы освободить человечество от контроля машин. Фильм сочетает философские идеи с динамичными боевыми сценами и эффектами.",
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(movie: movies[index])));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.redAccent.shade100, Colors.pinkAccent.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20)),
                    child: Image.network(
                      movies[index].image,
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    blurRadius: 3,
                                    color: Colors.black38,
                                    offset: Offset(1, 1))
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellowAccent, size: 18),
                              SizedBox(width: 5),
                              Text(
                                movies[index].rating.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Movie movie;

  DetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.network(
                    movie.image,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellowAccent),
                        SizedBox(width: 5),
                        Text(
                          movie.rating.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                movie.description,
                style: TextStyle(fontSize: 18, height: 1.4),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.pinkAccent],
                  ),
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Добавлено в избранное!")));
                  },
                  icon: Icon(Icons.favorite, color: Colors.white),
                  label: Text("Добавить в избранное",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}