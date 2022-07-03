import 'package:corona_app_ui_main_professinal/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  List selectedCategoryList = indicationsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'COVID-19',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff393E46)),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/lift_ic.svg')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/search_ic.svg')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                width: double.infinity,
                height: 163,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Emergency',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff32E0C4),
                            fontWeight: FontWeight.w400,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('How to know if I have covid-19?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xff32E0C4),
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Call Now',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  // backgroundColor: const Color(0xff32E0C4),
                                  side: const BorderSide(
                                      color: Color(0xff32E0C4)),
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Guide',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text('Covid-19 Guide',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff393E46),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: 20,
                  ),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: _selectedCategory == index
                              ? const Color(0xff32E0C4)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      onPressed: () {
                        setState(() {
                          _selectedCategory = index;
                          selectedCategoryList =
                              categories[index]['ArrayMappedName'] as List;
                        });
                      },
                      child: Text(
                        categories[index]['label'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _selectedCategory == index
                                ? Colors.white
                                : const Color(0xff393E46)),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 183,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedCategoryList.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: 20,
                        ),
                        child: buildContainerItems(
                            context,
                            selectedCategoryList[index]["image"],
                            selectedCategoryList[index]["title"],
                            selectedCategoryList[index]["supTitle"]),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                height: 192,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/learn_back_ground.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '''Be aware 
From Covid-19''',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff393E46)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff222831),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Learn More',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff32E0C4)),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerItems(
      BuildContext context, String image, String label, String supTitle) {
    return Container(
      width: 140,
      height: 183,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff393E46),
      ),
      child: Column(
        children: [
          SvgPicture.asset(image),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff32E0C4)),
            ),
          ),
          Expanded(
            child: Text(
              supTitle,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}
