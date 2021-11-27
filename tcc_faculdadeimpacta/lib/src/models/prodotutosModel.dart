//tudo que vier do banco de dados
//Isso vai ser trabalhado no banco de dados


  class ProdutosModel {

    final String id;
    final String nome;
    final String imagem;
    final String categoria;
    final double valor;
    final double desconto;
    final double avaliacoes;

    ProdutosModel({
      required this.id,
      required this.nome,
      required this.imagem,
      required this.categoria,
      required this.valor,
      required this.desconto,
      required this.avaliacoes});

  }

    final List<ProdutosModel> produtos = [
      ProdutosModel(
        id: "1",
        nome: "Rosa",
        imagem: "assets/imagens/Rectangle3292rosa.png",
        categoria: "Corte",
        valor: 50,
        desconto: 3,
        avaliacoes: 5,

      ),
      ProdutosModel(
        id: "2",
        nome: "Rosa Champagne",
        imagem: "assets/imagens/Rectangle3293rosachampagne.png",
        categoria: "Corte",
        valor: 50,
        desconto: 3,
        avaliacoes: 5,

      ),
      ProdutosModel(
        id: "3",
        nome: "Túlipa",
        imagem: "assets/imagens/Rectangle3261tulipa.png",
        categoria: "Corte",
        valor: 50,
        desconto: 3,
        avaliacoes: 5,

      ),


    ];
