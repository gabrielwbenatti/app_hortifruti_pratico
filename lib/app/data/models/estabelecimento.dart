import 'package:app_hortifruti_pratico/app/data/models/categoria.dart';

class EstabelecimentoModel {
  int id;
  String nome;
  String image;
  bool isOnline;
  List<CategoriaModel> categorias;

  EstabelecimentoModel({
    required this.id,
    required this.nome,
    required this.image,
    required this.isOnline,
    required this.categorias,
  });

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) {
    return EstabelecimentoModel(
      id: json['id'],
      nome: json['nome'],
      image: json['logo'],
      isOnline: json['online'] == 1,
      categorias: json['categorias'] == null
          ? []
          : List<CategoriaModel>.from(
              json['categorias'].map(
                (categoria) => CategoriaModel.fromJson(categoria),
              ),
            ),
    );
  }
}
