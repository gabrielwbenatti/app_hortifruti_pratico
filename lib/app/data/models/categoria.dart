import 'package:app_hortifruti_pratico/app/data/models/produto.dart';

class CategoriaModel {
  int id;
  String nome;
  List<ProdutoModel> produtos;

  CategoriaModel({
    required this.id,
    required this.nome,
    required this.produtos,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(
      id: json['id'],
      nome: json['nome'],
      produtos: json['produtos'] == null
          ? []
          : List<ProdutoModel>.from(
              json['produtos'].map(
                (produto) => ProdutoModel.fromJson(json),
              ),
            ),
    );
  }
}
