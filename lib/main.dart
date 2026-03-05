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
      ),
      home: HomePage(),
    );
  }
}

class Movie {
  final String title;
  final String image;
  final String description;

  Movie({required this.title, required this.image, required this.description});
}

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Начало",
      image: "https://picsum.photos/200/300?1",
      description: "Доминек Кобб — опытный вор, который крадет секреты из подсознания во время сна. "
          "Ему предлагают невероятно опасное задание — не украсть информацию, а внедрить идею в мозг человека. "
          "Фильм показывает грань между реальностью и миром снов и задает вопросы о природе сознания.",
    ),
    Movie(
      title: "Интерстелларр",
      image: "https://picsum.photos/200/300?2",
      description: "Группа исследователей отправляется в космическую миссию через червоточину, чтобы найти новую планету, "
          "где человечество сможет выжить. Фильм рассказывает о путешествиях во времени, любви и жертвах, "
          "необходимых ради спасения всего человечества.",
    ),
    Movie(
      title: "Тёмный рыцарь",
      image: "https://picsum.photos/200/300?3",
      description: "Бэтмен продолжает бороться с преступностью в Готэме, сталкиваясь с новым опасным противником — Джокером. "
          "Фильм исследует моральные дилеммы, хаос и порядок, а также личную цену борьбы за справедливость.",
    ),
    Movie(
      title: "Матрица",
      image: "https://picsum.photos/200/300?4",
      description: "Нео — обычный программист, который узнает, что весь мир вокруг него — компьютерная симуляция. "
          "Он присоединяется к сопротивлению, чтобы освободить человечество от контроля машин. "
          "Фильм сочетает философские идеи с динамичными боевыми сценами и эффектами.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movie: movies[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                    child: Image.network(
                      movies[index].image,
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      movies[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                movie.description,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Добавлено в избранное!")),
                  );
                },
                child: Text("Добавить в избранное"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
