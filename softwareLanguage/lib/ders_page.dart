import 'package:flutter/material.dart';

class DersPage extends StatelessWidget {
  final String subject;

  DersPage({required this.subject});

  @override
  Widget build(BuildContext context) {
    List<String> javaBilgileri = [
      'Java bir programlama dilidir.',
      'Java çok platformlu bir dilidir.',
      'Java Nesne Yönelimli Programlama (OOP) prensiplerine dayanır.',
      'Java, Sun Microsystems tarafından geliştirilmiştir.',
      'Java, web ve mobil uygulama geliştirme için yaygın olarak kullanılır.',
      'Java, derlenmiş bir dildir ve JVM üzerinde çalışır.'
    ];

    List<String> cBilgileri = [
      'C programlama dili, Dennis Ritchie ve Brian Kernighan tarafından geliştirilmiştir.',
      'C, genellikle sistem programlama için kullanılır.',
      'C, yüksek seviyeli ve derleyici bir dildir.',
      'C, UNIX işletim sisteminin geliştirilmesinde kullanılmıştır.',
      'C, modern programlama dillerinin çoğunun temelini oluşturur.',
      'C, performans ve düşük seviye erişim sağlar.'
    ];

    List<String> pythonBilgileri = [
      'Python, basit ve anlaşılabilir bir dil olmasıyla bilinir.',
      'Python, genellikle veri analizi, yapay zeka ve web geliştirme gibi alanlarda kullanılır.',
      'Python, kolay okunabilir ve öğrenmesi kolay bir dildir.',
      'Python, Guido van Rossum tarafından geliştirilmiştir.',
      'Python, büyük bir topluluk ve geniş bir kütüphane desteğine sahiptir.',
      'Python, hem prosedürel hem de nesne yönelimli programlamayı destekler.'
    ];

    List<String> bilgiler;
    if (subject == 'Java') {
      bilgiler = javaBilgileri;
    } else if (subject == 'C') {
      bilgiler = cBilgileri;
    } else if (subject == 'Python') {
      bilgiler = pythonBilgileri;
    } else {
      return Scaffold(
        body: Center(
          child: Text('Bilgiler bulunamadı.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: bilgiler.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: ListTile(
                  title: Text(
                    bilgiler[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
