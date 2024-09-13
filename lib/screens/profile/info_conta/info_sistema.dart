import 'package:flutter/material.dart';

class InfoSistema extends StatelessWidget {
  const InfoSistema({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informações",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Termos e Privacidade",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("1. Aceitação dos Termos"),
            _buildSectionContent(
              "Ao utilizar nosso site, você concorda com os termos e condições aqui estabelecidos. Caso não concorde com algum desses termos, recomendamos que cesse o uso do nosso serviço imediatamente.",
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("2. Serviços Oferecidos"),
            _buildSectionContent(
              "Nosso site oferece uma plataforma para locação de ambientes, conectando locadores e locatários. Não somos responsáveis pela negociação direta entre as partes, cabendo aos usuários definir os detalhes de locação e uso.",
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("3. Coleta de Informações"),
            _buildSectionContent(
              "Coletamos informações pessoais fornecidas por você, como nome, e-mail e dados de pagamento, ao se cadastrar ou realizar transações em nosso site.",
            ),
            
            const SizedBox(height: 20),
            _buildSectionTitle("4. Segurança dos Dados"),
            _buildSectionContent(
              "Tomamos medidas para proteger suas informações contra acesso não autorizado, perda ou roubo. No entanto, nenhum método de transmissão ou armazenamento eletrônico é 100% seguro.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(content),
    );
  }
}
