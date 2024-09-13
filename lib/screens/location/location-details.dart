import 'package:flutter/material.dart';
import 'package:locapp_front/models/location.dart';
import 'package:locapp_front/screens/location/maps/localizacao_info.dart';
import 'package:locapp_front/screens/location/location-form.dart';

class LocationDetails extends StatefulWidget {
  final Location location;

  const LocationDetails({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  late String title;
  late String description;
  late String price;
  late List<String> imageUrls;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    // Atribuindo os dados recebidos do objeto Location
    title = widget.location.name;
    description = 'Descrição breve sobre o local de locação'; // Se quiser customizar depois
    price = 'R\$${widget.location.price.toString()} p/ Horário';
    imageUrls = [ // Exemplo de imagem; depois pode vir do Firestore
      'https://th.bing.com/th/id/OIP.r5jzGByVNVqcIi7q0n09kAHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
    ];
  }

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
                        title, // Usando o nome do local recebido
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Botão de favoritar
                    IconButton(
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
                  ],
                ),
              ),

              // Carrossel de imagens dinâmico
              const SizedBox(height: 10,),
              SizedBox(
                height: size.height * 0.4,
                child: PageView(
                  children: imageUrls.map((url) {
                    return Image.network(
                      url,  // Imagens dinâmicas
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),

              // Descrição do local
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,  // Descrição dinâmica
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),

              // Botão para localização
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LocalizacaoMenu(
                  title: 'Localização', 
                  subtitle: 'Veja a localização no mapa', 
                  icon: Icons.map, 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocalizacaoInfo(location: widget.location.geopoint), // Passando o GeoPoint
                      ),
                    );
                  },
                ),
              ),

              // Preço e botão de reservar
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          MaterialPageRoute(builder: (context) => ReservationForm(location: widget.location)),
                        );
                      },
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