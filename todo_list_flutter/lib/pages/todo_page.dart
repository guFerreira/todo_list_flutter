// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_flutter/model/tarefa_model.dart';
import 'package:todo_list_flutter/widgets/form_tarefa.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  List<Tarefa> tarefas = [
    Tarefa(descricao: "Nova tarefa criada", isConcluida: true),
    Tarefa(descricao: "Lavar a louça", isConcluida: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO-DO List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(60),
                bottom: Radius.zero,
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return FormTarefa(
                  titulo: "Adicionar nova tarefa", tituloBotao: "Criar");
            },
          );
        },
        tooltip: 'Adicionar nova tarefa',
        child: const Icon(Icons.add),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: const [
                      SlidableAction(
                        onPressed: showFormAtualizarTarefa,
                        backgroundColor: Color(0xFFE6E21F),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                      SlidableAction(
                        onPressed: exibirDialogoExcluirTarefa,
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Excluir',
                      )
                    ],
                  ),
                  child: buildListTile(tarefas[index]),
                );
              })),
    );
  }

  Widget buildListTile(Tarefa tarefa) {
    return CheckboxListTile(
      value: tarefa.isConcluida,
      title: Text(
        tarefa.descricao,
        style: TextStyle(
            decoration: tarefa.isConcluida
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? newValue) {},
    );
  }
}

void exibirDialogoExcluirTarefa(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("teste"),
    ),
  );
}

RoundedRectangleBorder getShapeFormTarefa() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(60),
      bottom: Radius.zero,
    ),
  );
}

void showFormAtualizarTarefa(BuildContext context) {
  showModalBottomSheet(
    shape: getShapeFormTarefa(),
    context: context,
    builder: (BuildContext context) {
      return FormTarefa(titulo: "Atualizar tarefa", tituloBotao: "Atualizar");
    },
  );
}
