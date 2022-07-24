class EstabelecimentoModel {
  int id;
  String nome;
  String image;
  bool isOnline;

  EstabelecimentoModel({
    required this.id,
    required this.nome,
    required this.image,
    required this.isOnline,
  });

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) =>
      EstabelecimentoModel(
        id: json['id'],
        nome: json['nome'],
        image: json['logo'],
        isOnline: json['online'] == 1,
      );
}
