import 'dart:convert';

class Tarefa {
  String descricao;
  bool isConcluida;
  Tarefa({
    required this.descricao,
    required this.isConcluida,
  });

  Tarefa copyWith({
    String? descricao,
    bool? isConcluida,
  }) {
    return Tarefa(
      descricao: descricao ?? this.descricao,
      isConcluida: isConcluida ?? this.isConcluida,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'isConcluida': isConcluida,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      descricao: map['descricao'] ?? '',
      isConcluida: map['isConcluida'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefa.fromJson(String source) => Tarefa.fromMap(json.decode(source));

  @override
  String toString() =>
      'Tarefa(descricao: $descricao, isConcluida: $isConcluida)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tarefa &&
        other.descricao == descricao &&
        other.isConcluida == isConcluida;
  }

  @override
  int get hashCode => descricao.hashCode ^ isConcluida.hashCode;
}
