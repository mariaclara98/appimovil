import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/models/movie_model.dart';
import 'package:flutter_movie_api/src/services/movie_service.dart';
import 'package:flutter_movie_api/src/widgets/search_page.dart';
import 'package:flutter_movie_api/src/widgets/list_http_json.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  List<Movie>? _list;

  @override
  void initState() {
    super.initState();
    _downloadData();
  }

  @override
  Widget build(BuildContext context) {
    // Si _list es null, muestra un indicador de carga
    if (_list == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    // Si _list no es null, crea el contenido de la pantalla
    List<Widget> content = [
      ListHtppJson(movieList: _list!),
      SearchMovie(movieList: _list!), // Se pasa la lista como argumento
      const Center(child: Text("Cuenta (próximamente)")),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
        child: Center(
          child: SingleChildScrollView(child: content[_index]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Búsqueda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_sharp), label: "Cuenta"),
        ],
      ),
    );
  }

  _downloadData() async {
    MovieService service = MovieService();
    _list = await service.getContent();
    if (mounted) {
      setState(() {});
    }
  }
}
