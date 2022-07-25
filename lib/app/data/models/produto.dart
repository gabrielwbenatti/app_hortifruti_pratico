class ProdutoModel {
  int id;
  String nome;
  String? descricao;
  String? imagem;
  num preco;
  String unidade;

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
      nome: json['name'],
      descricao: json['descricao'],
      imagem: json['imagem'],
      preco: json['preco'],
      unidade: json['unidade'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
