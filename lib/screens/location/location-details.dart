import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locapp/screens/location/maps/localizacao_info.dart';
import 'package:locapp/screens/location/location-form.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:locapp/screens/home/components/containers/primary_header.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  // Variáveis para armazenar os dados dinâmicos
  String title = 'Nome do Local';
  String description = 'Descrição breve sobre o local de locação.';
  List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.r5jzGByVNVqcIi7q0n09kAHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
  ];
  List<Map<String, String>> openingHours = [
    {'day': 'Dom', 'hours': '--'},
    {'day': 'Seg', 'hours': '08h - 18h'},
    {'day': 'Ter', 'hours': '08h - 18h'},
    {'day': 'Qua', 'hours': '08h - 18h'},
    {'day': 'Qui', 'hours': '08h - 18h'},
    {'day': 'Sex', 'hours': '08h - 18h'},
    {'day': 'Sab', 'hours': '--'}
  ];
  String price = 'R\$18 p/ Horário';

  bool isFavorited = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com botão de voltar, título e favoritar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botão de voltar
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    
                    // Nome do local centralizado
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    // Botão de favoritar
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorited = !isFavorited;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Carrossel de imagens dinâmico
              const SizedBox(height: 10,),
              Center(
                child: Container(
                  height: size.height * 0.3,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: PageView(
                    children: imageUrls.map((url) {
                      return Image.network(
                        url,  // Imagens dinâmicas
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Descrição do local
              const SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      description,  // Descrição dinâmica
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),

              // Tabela de horários dinâmicos
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
                children: [
                  // Linha dos dias
                  TableRow(
                    children: openingHours.map((day) {
                      return TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              day['day']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  // Linha das horas
                  TableRow(
                    children: openingHours.map((day) {
                      return TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              day['hours']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),


              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LocalizacaoMenu(
                  title: 'Localização', 
                  subtitle: 'Localização do ambiente', 
                  icon: Icons.map, 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LocalizacaoInfo()));
                  }),
              ),

              // Preço e botão de reservar
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,  // Preço dinâmico
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReservationForm()),
                        );
                      },
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      label: const Text('Reservar'),
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocalizacaoMenu extends StatelessWidget{
   const LocalizacaoMenu({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

    final String title;
    final String subtitle;
    final IconData icon;
    final VoidCallback onPressed;
    final bool endIcon;
    final Color? textColor;

    @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,

      leading: Container(
        width: 40, 
        height: 40,
        child: Icon(icon),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium?.apply(color: textColor)),
      trailing: endIcon? Container(
              width: 30, 
              height: 30,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 16,),
            ) : null, 
    );
   
  }
}