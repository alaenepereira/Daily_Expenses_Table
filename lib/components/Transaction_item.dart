import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {

   final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

 
  @override
  Widget build(BuildContext context) {

     
 return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),
        title: Text(tr.title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
        ? TextButton.icon(
          onPressed:  () => onRemove(tr.id) ,
           icon: Icon(Icons.delete),
          label: Text('Excluir'),
         style: TextButton.styleFrom(
           foregroundColor: Theme.of(context).colorScheme.error
         ),
        )

        : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemove(tr.id),
        ),
      ),
    );
   
  }
}

