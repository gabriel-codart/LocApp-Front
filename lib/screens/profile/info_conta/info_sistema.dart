import 'package:flutter/material.dart';

class InfoSistema extends StatefulWidget {
  const InfoSistema({super.key});

  @override
  State<InfoSistema> createState() => _InfoSistemaState();
}

class _InfoSistemaState extends State<InfoSistema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Informações", style: TextStyle(color: Colors.black54),),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Text("Termos e Privacidade",style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                  ),),
          const SizedBox(height: 20,),
          Row(
            children: [
                Text("1. Aceitação dos Termos", style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                  ),),
            ],
          ),
          const SizedBox(height: 10,),
          Text("Ao utilizar nosso site, você concorda com os termos e condições aqui estabelecidos. Caso não concorde com algum desses termos, recomendamos que cesse o uso do nosso serviço imediatamente."),
          const SizedBox(height: 20,),
          Row(
            children: [
              Text("2. Serviços Oferecidos", style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                  ),),
            ],
          ),
          const SizedBox(height: 10,),
          Text("Nosso site oferece uma plataforma para locação de ambientes, conectando locadores e locatários. Não somos responsáveis pela negociação direta entre as partes, cabendo aos usuários definir os detalhes de locação e uso."),
          
          const SizedBox(height: 20,),
            Row(
              children: [
              Text("3. Coleta de Informações", style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          Text("Coletamos informações pessoais fornecidas por você, como nome, e-mail e dados de pagamento, ao se cadastrar ou realizar transações em nosso site."),

          const SizedBox(height: 20,),
          Row(
            children: [
            Text("4. Segurança dos Dados", style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                  ),),
            ],
          ),
          Text("Tomamos medidas para proteger suas informações contra acesso não autorizado, perda ou roubo. No entanto, nenhum método de transmissão ou armazenamento eletrônico é 100% seguro."),
        ],
      ),
    );
  }
}