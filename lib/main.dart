import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() { 
  runApp(const SimplePortfolioApp());
}

class SimplePortfolioApp extends StatelessWidget {
  const SimplePortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      home: Homepage(),  
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}
  


class _HomepageState extends State<Homepage> {
  String selectedPage = 'Home';
  late ScrollController _scrollController;
 
  @override
  void initState() {
  super.initState();
  _scrollController = ScrollController();
}
   Widget _buildContent() {
  if (selectedPage == 'Home') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            'lib/assets/images/Ezekiel.jpg',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Your Full Name',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  return Text('Coming soon: $selectedPage');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F5F),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon (Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },  
            );
          }
        ),

        title: Text('Portfolio',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600,),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(    
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,  
                children: [
                  Text('Dan Ezekiel C Cunanan'),
                  SizedBox(height: 4),
                  Text('FLutter Developer'),
                ],         
              ),
            ),

                  
                ListTile(
        leading: Icon(Icons.home, color: Colors.blue),
        title: Text('Home'),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            selectedPage = 'Home';
          });
        },
      ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.blue),
          title: Text('About'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              selectedPage = 'About';
            });
          },
        ),
        ListTile(
          leading: Icon(Icons.lightbulb, color: Colors.blue),
          title: Text('Skills'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              selectedPage = 'Skills';
            });
          },
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.blue),
          title: Text('Contact'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              selectedPage = 'Contact';
            });
          },
        ), 
        Divider(),
      ListTile(
        leading: Icon(Icons.download, color: Colors.blue),
        title: Text('Download Resume'),
        onTap: () {
          Navigator.pop(context);
          print('Download Resume tapped');
        },
      ),
      ],
      )
      ),  
        body: SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: _buildContent(),
        ),
      ),
    ),
    );
  }

  @override
  void dispose() {
  _scrollController.dispose();
  super.dispose();
} 
  }

