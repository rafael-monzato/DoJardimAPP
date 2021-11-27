//classe que vai passar de forma momentanea os dados
import 'package:tcc_faculdadeimpacta/src/models/prodotutosModel.dart';
import 'package:tcc_faculdadeimpacta/src/dados/produtodados.dart';

class ProdutosDados{

  final String id;
  final String nome;
  final String imagem;
  final String categoria;
  final double valor;
  final double desconto;
  final double avaliacoes;

  ProdutosDados({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.categoria,
    required this.valor,
    required this.desconto,
    required this.avaliacoes});
}

final produtos = [
  ProdutosDados(
  id: "1",
  nome: "Ola",
  imagem: "assets/imagens/Rosaflores.png",
  categoria: "Corte",
  valor: 50,
  desconto: 3,
  avaliacoes: 5,

  ),

];