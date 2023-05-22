import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imageList = [
  'https://agendor-blog-uploads.s3.sa-east-1.amazonaws.com/2017/07/29115456/tendencia-de-mercado.jpg',
  'https://blog.paghiper.com/wp-content/uploads/2018/03/tend.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDL3_MJi6Hr5_RX5FLnQf14xbXYi0XP4p57ylDU8qruEZ-5in9Xv-6StrMyoh-4LN4XhQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPZIqTgm8_viI3PDIg383rORt9bS6DjyZTjgMHP8P9gd20-c9u_8qXlpgI3km263x2Xkw&usqp=CAU',
];

final List<String> titulos = [
  'Tendência 1',
  'Tendência 2',
  'Tendência 3',
  'Tendência 4',
];

final List<String>linksFotos = [
  'https://www2.deloitte.com/br/pt/pages/risk/solutions/risk-sensing0.html?id=br:2pm:3gl:4Risk-Sensing:5awa:6oth&gclid=CjwKCAjwpayjBhAnEiwA-7ena2Gguv9AQNFQcbntjUqsftAnfZYCycsYG6A1U9gTV3i9dN',
  'https://www.pimco.com.br/pt-br/insights/economic-and-market-commentary/?gad=1&gclid=CjwKCAjwpayjBhAnEiwA-7enazJ6dLdWP1VxP9wkSNjx4ioLRox1gCBXkFvZL5myK2LMO1zm2i4oFhoCtD4QAvD_BwE&gclsrc=aw.ds&',
  'https://neilpatel.com/br/blog/tendencias-de-mercado/',
  'https://agilize.com.br/blog/tendencias/tendencias-de-mercado/',
]; 

var _currentIndex = 0;

class CarouselTeste extends StatefulWidget {
  const CarouselTeste({Key? key}) : super(key: key);

  @override
  State<CarouselTeste> createState() => _CarouselTesteState();
}

class _CarouselTesteState extends State<CarouselTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel de Tendências'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              //enlargeCenterPage: true,
              //scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: imageList
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      elevation: 6.0,
                      shadowColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.00),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Center(
                              child: Text(
                                '${titulos[_currentIndex]}',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.black45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.map((urlOfItem) {
              int index = imageList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 2.0
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                  ? Color.fromRGBO(0,0,0,0.8)
                  : Color.fromRGBO(0, 0, 0, 0.3)
                ),
              );
            }).toList()
          ),
        ],
      ),
    );
  }
}
