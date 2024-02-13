import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue, // Cor de fundo da app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showUserPhotoDialog(context);
              },
              child: const Hero(
                tag: 'user_photo',
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('URL_DA_FOTO_DO_USUARIO'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Nome do Usuário',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Cor do texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Barbearias Próximas:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Cor do texto
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Número de barbearias
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Ação ao selecionar uma barbearia
                  },
                  child: Card(
                    elevation: 3, // Elevação do cartão
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'URL_DA_FOTO_DA_BARBEARIA_${index + 1}'),
                      ),
                      title: Text(
                        'Barbearia ${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Endereço da Barbearia ${index + 1}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber,
                                  size:
                                      16), // Ícone de estrela para a classificação
                              const SizedBox(width: 5),
                              Text(
                                '4.${index}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUserPhotoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: 'user_photo',
              child: Image.network(
                'URL_DA_FOTO_DO_USUARIO',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
