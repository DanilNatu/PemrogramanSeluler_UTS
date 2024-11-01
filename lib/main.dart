import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

void _launchURL() async {
  const url = 'https://www.instagram.com/dleonrd_';
  if ( await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIODATA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          
        )
      ),
      home: const MyHomePage(title: 'BIODATA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homekey = GlobalKey();
  final GlobalKey _aboutkey = GlobalKey();
  final GlobalKey _educationkey = GlobalKey();
  final GlobalKey _contactkey = GlobalKey();

  String? _selectedSection; // Menyimpan bagian yang dipilih

  void _scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      // Mendapatkan posisi dari widget berdasarkan GlobalKey
      final position = context.findRenderObject() as RenderBox;
      final offset = position.localToGlobal(Offset.zero).dy + _scrollController.offset;

      // Menentukan offset scroll posisi elemen
      _scrollController.animateTo(
        offset, // Offset posisi elemen
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      // Mengatur bagian yang dipilih
      setState(() {
        _selectedSection = section;
      });
    }
  }

  Widget _headerBagian ({
    required String title
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),  
            ),
          ],
        ),
        const Divider(thickness: 2),
      ],
    );
  }

  Widget _listKemampuan ({
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [     
          Icon(
            icon,
            size: 7,
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14
              )
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 35,
        title: const Text(
          'BIODATA',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 35, 34, 34),
      body: Row(
        children: [
          const SizedBox(width: 15),

          // Sidebar
          Container(
            width: MediaQuery.of(context).size.width < 811 ? 60 : MediaQuery.of(context).size.width * 0.2,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: 
            LayoutBuilder(
              builder: (context, constraints) {
                bool isCompact = constraints.maxWidth < 161;
                return Column(
                  children: [
                    if (!isCompact)
                      Image.asset(
                        'images/Sidebar.jpg',
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),

                    const SizedBox(height: 15),

                    ListTile(
                      selected: _selectedSection == 'Home',
                      leading: const Icon(Icons.home),
                      title: isCompact ? null : const Text('Home'), // Sembunyikan teks jika `isCompact` bernilai true
                      onTap: () => _scrollToSection(_homekey, 'Home'),
                    ),

                    const Divider(),

                    ListTile(
                      selected: _selectedSection == 'About',
                      leading: const Icon(Icons.person),
                      title: isCompact ? null : const Text('About'), // Sembunyikan teks jika `isCompact` bernilai true
                      onTap: () => _scrollToSection(_aboutkey, 'About'),
                    ),

                    const Divider(),

                    ListTile(
                      selected: _selectedSection == 'Pendidikan',
                      leading: const Icon(Icons.school),
                      title: isCompact ? null : const Text('Pendidikan'), // Sembunyikan teks jika `isCompact` bernilai true
                      onTap: () => _scrollToSection(_educationkey, 'Pendidikan'),
                    ),

                    const Divider(),

                    ListTile(
                      selected: _selectedSection == 'Contact',
                      leading: const Icon(Icons.email),
                      title: isCompact ? null : const Text('Contact'), // Sembunyikan teks jika `isCompact` bernilai true
                      onTap: () => _scrollToSection(_contactkey, 'Contact'),
                    ),
                  ],
                );
              },
            ),
          ),
          //Sidebar End

          // Content Area
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: Column(
                  children: [
                    
                    // Home
                    Padding(
                      key: _homekey,
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 25,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.653, 
                        height: MediaQuery.of(context).size.height * 0.48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: const DecorationImage(
                            alignment: Alignment.centerRight,
                            image: AssetImage('images/HomePG.png'),
                          ),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),

                        
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Denilson Leonardo Natu',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, 
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 42230034', 
                                      style: TextStyle(
                                        fontSize: 15, 
                                        color: Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 10),
                              
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.345,
                                child: const Divider(
                                  thickness: 1,
                                  color: Colors.black54, 
                                ),
                              ),

                              const Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      'Fakultas Teknik dan Informatika',
                                      style: TextStyle(
                                        fontSize: 15, 
                                        color: Color.fromARGB(255, 120, 119, 119),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '|',
                                      style: TextStyle(
                                        fontSize: 25, 
                                        color: Color.fromARGB(255, 120, 119, 119),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      'Teknologi Informasi',
                                      style: TextStyle(
                                        fontSize: 15, 
                                        color: Color.fromARGB(255, 120, 119, 119),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ),
                    ),


                    // About
                    Padding(
                      key: _aboutkey,
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 25,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.653,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              _headerBagian(title: 'About'),

                              const SizedBox(height: 20),
                              const Text(
                                '       Saya Denilson Leonardo Natu, seorang mahasiswa S1 Teknologi Informasi' 
                                ' di Universitas Pendidikan Nasional, berumur 20 tahun. Saya lahir pada tanggal' 
                                ' 6 Juni 2003 di Kefa, Nusa Tenggara Timur, dan merupakan anak ketiga dari empat' 
                                ' bersaudara. Ayah saya bernama Samuel S. Natu dan ibu saya bernama Viviana L. Saunoah.' 
                                ' Saya mampu berkomunikasi dan menganalisis dengan baik, yang membantu saya beradaptasi' 
                                ' dengan cepat pada lingkungan dan tugas baru. Saat ini, saya aktif dalam organisasi' 
                                ' Keluarga Mahasiswa Kristen Protestan, serta memiliki minat dalam berolahraga, terutama' 
                                ' basket, dan bermain game. Tujuan saya saat ini adalah menguasai bahasa pemrograman' 
                                ' secara mendalam dan menyelesaikan studi tepat waktu.'
                              ),

                              const SizedBox(height: 20),
                              const Text(
                                'Kemampuan yang saya miliki, sebagai berikut:',
                                style: TextStyle(
                                  fontSize: 14, 
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              const SizedBox(height: 5),
                              
                              _listKemampuan(icon: Icons.circle, title: 'Mampu berkomunikasi dalam tim dengan baik'),

                              _listKemampuan(icon: Icons.circle, title: 'Kreatif dan inovatif'),

                              _listKemampuan(icon: Icons.circle, title: 'Kemampuan analisis yang baik'),

                              _listKemampuan(icon: Icons.circle, title: 'Manajemen waktu yang baik'),       
                            ],   
                          ),
                        )  
                      ),
                    ),
                    
                    // Pendidikan
                    Padding(
                      key: _educationkey,
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 25,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.653,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: const DecorationImage(
                            alignment: Alignment.bottomRight,
                            image: AssetImage('images/Pendidikan.jpg'),
                          ),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              _headerBagian(title: 'Pendidikan'),

                              const SizedBox(height: 30),
                                  
                              const Text(
                                'Universitas Pendidikan Nasional',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text(
                                'Teknologi Informasi | 2022 - Sekarang',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 120, 119, 119)
                                ),
                              ),

                              const SizedBox(height: 30),
                          
                              const Text(
                                'SMA Katolik Giovanni Kupang',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text(
                                '2019 - 2022',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 120, 119, 119)
                                ),
                              ),
                              const SizedBox(height: 30), 
                            ],   
                          ),
                        )  
                      ),
                    ),
                    
                    // Contact 
                    Padding(
                      key: _contactkey,
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.653, 
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  _headerBagian(title: 'Contact'),

                                  const SizedBox(height: 50),
                                  const Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 10),
                                      Text('Denilson Leonardo Natu')
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Icon(Icons.email),
                                      SizedBox(width: 10),
                                      Text('natudenilson@gmail.com')
                                    ],
                                  ),

                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Icon(Icons.phone),
                                      SizedBox(width: 10),
                                      Text('+6282190307865')
                                    ],
                                  ),

                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 10),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text('Jl. Bedugul No. 17, Sidakarya, Denpasar Selatan, Bali')
                                      ),
                                    ],
                                  ),

                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                      left: 50,
                                    ),
                                    child: Tooltip(
                                      message: 'Instagram',
                                      child: IconButton(
                                        icon: FaIcon(FontAwesomeIcons.instagram),
                                        onPressed: _launchURL,
                                        color: Colors.pink,
                                        iconSize: 30,
                                      ),
                                    ),
                                  ),  
                                ],   
                              ),
                            )  
                          ),
                        ],
                      )  
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content Area End

        ],
      ),
    );
  }
}