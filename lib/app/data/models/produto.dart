class ProdutoModel {
  int id;
  String nome;
  String? descricao;
  String? imagem;
  num preco;
  String unidade;

  bool get isKG => unidade == 'KG';

  ProdutoModel({
    required this.id,
    required this.nome,
    this.descricao,
    this.imagem,
    required this.preco,
    required this.unidade,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      imagem: json['imagem'],
      preco: json['preco'],
      unidade: json['unidade'],
    );
  }
}
