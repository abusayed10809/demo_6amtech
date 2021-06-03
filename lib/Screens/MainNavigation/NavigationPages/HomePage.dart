import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_6amtech/Models/AllCategory.dart';
import 'package:test_6amtech/Models/BannerModel.dart';
import 'package:test_6amtech/Models/PopularItems.dart';
import 'package:test_6amtech/Models/SetMenu.dart';
import 'package:test_6amtech/Provider/AllCategoryProvider.dart';
import 'package:test_6amtech/Provider/BannerProvider.dart';
import 'package:test_6amtech/Provider/PopularItemProvider.dart';
import 'package:test_6amtech/Provider/SetMenuProvider.dart';
import 'package:test_6amtech/Widgets/PersistentHeader.dart';
import 'package:test_6amtech/Widgets/Widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<AllCategory> allCategoryList = [];
  List<BannerModel> allBannerList = [];
  List<PopularItems> allPopularItemList = [];
  List<SetMenu> allSetMenuList = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final globalFontSize = MediaQuery.of(context).textScaleFactor;

    Provider.of<AllCategoryProvider>(context);
    Provider.of<SetMenuProvider>(context);
    Provider.of<BannerProvider>(context);
    Provider.of<PopularItemProvider>(context);

    allCategoryList = Provider.of<AllCategoryProvider>(context, listen: false).allCategoryList;
    allSetMenuList = Provider.of<SetMenuProvider>(context, listen: false).setMenuList;
    allBannerList = Provider.of<BannerProvider>(context, listen: false).bannerList;
    allPopularItemList = Provider.of<PopularItemProvider>(context, listen: false).popularItemList;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // =================================================================
            // =================================================================
            // HEADER SEARCH FIELD
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: PersistentHeader(
                  minHeight: height * 0.2,
                  maxHeight: height * 0.2,
                  child: homePageHeader(context),
              ),
            ),

            // =================================================================
            // =================================================================
            // ALL CATEGORIES
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.05,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: AutoSizeText(
                          'All Categories',
                          style: TextStyle(
                            fontSize: globalFontSize * 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allCategoryList.length,
                          itemBuilder: (context, index){
                            AllCategory allCategoryItem = new AllCategory();
                            allCategoryItem = allCategoryList[index];
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.015),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: width * 0.1,
                                    backgroundColor: Colors.deepOrangeAccent,
                                    backgroundImage: NetworkImage(
                                      allCategoryItem.image,
                                    ),
                                  ),
                                  AutoSizeText(
                                    allCategoryItem.name,
                                    style: TextStyle(fontSize: globalFontSize * 12),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =================================================================
            // =================================================================
            // SET MENU
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.05,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Row(
                          children: [
                            AutoSizeText(
                              'Set Menu',
                              style: TextStyle(
                                fontSize: globalFontSize * 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            AutoSizeText(
                              "View All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: globalFontSize*12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.28,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allSetMenuList.length,
                          itemBuilder: (context, index){
                            SetMenu setMenu = new SetMenu();
                            setMenu.id = allSetMenuList[index].id;
                            setMenu.name = allSetMenuList[index].name;
                            setMenu.price = allSetMenuList[index].price;
                            setMenu.image = allSetMenuList[index].image;
                            setMenu.rating = allSetMenuList[index].rating;
                            return Card(
                              elevation: 2,
                              child: Container(
                                width: width*0.4,
                                child: Column(
                                  children: [
                                    Image.network(
                                      setMenu.image,
                                    ),
                                    Container(
                                      width: width*0.4,
                                      height: height*0.05,
                                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                                      child: AutoSizeText(
                                        setMenu.name,
                                        style: TextStyle(
                                          fontSize: globalFontSize * 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Container(
                                      width: width*0.4,
                                      height: height*0.03,
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: width*0.4,
                                      height: height*0.04,
                                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            "\$${setMenu.price}",
                                            style: TextStyle(
                                              fontSize: globalFontSize*12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Spacer(),

                                          Icon(
                                            Icons.add,
                                            size: width*0.08,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =================================================================
            // =================================================================
            // BANNER
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.05,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: AutoSizeText(
                          'Banner',
                          style: TextStyle(
                            fontSize: globalFontSize * 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allBannerList.length,
                          itemBuilder: (context, index){
                            BannerModel banner = new BannerModel();
                            banner.id = allBannerList[index].id;
                            banner.image = allBannerList[index].image;
                            return Card(
                              elevation: 2,
                              child: Container(
                                width: width*0.6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        banner.image,
                                      ),
                                      fit: BoxFit.fill
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            // =================================================================
            // =================================================================
            // POPULAR ITEM
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.05,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Row(
                          children: [
                            AutoSizeText(
                              'Popular Items',
                              style: TextStyle(
                                fontSize: globalFontSize * 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            AutoSizeText(
                              "View All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: globalFontSize*12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        height: height*0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: allPopularItemList.length,
                          itemBuilder: (context, index){
                            PopularItems popularItems = new PopularItems();
                            popularItems.id = allPopularItemList[index].id;
                            popularItems.name = allPopularItemList[index].name;
                            popularItems.price = allPopularItemList[index].price;
                            popularItems.image = allPopularItemList[index].image;
                            return Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width*0.01, vertical: width*0.01),
                                child: Container(
                                  height: height*0.15,
                                  width: width,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width*0.35,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                popularItems.image,
                                              ),
                                              fit: BoxFit.fill
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.025),
                                        ),
                                      ),

                                      Container(
                                        width: width*0.4,
                                        padding: EdgeInsets.symmetric(horizontal: width*0.015),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: width*0.02),
                                              child: AutoSizeText(
                                                popularItems.name,
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: globalFontSize*12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: height*0.03,
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.orangeAccent,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.orangeAccent,
                                                  ),Icon(
                                                    Icons.star,
                                                    color: Colors.orangeAccent,
                                                  ),Icon(
                                                    Icons.star,
                                                    color: Colors.orangeAccent,
                                                  ),Icon(
                                                    Icons.star,
                                                    color: Colors.orangeAccent,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Spacer(),

                                            Padding(
                                              padding: EdgeInsets.only(bottom: width*0.02),
                                              child: AutoSizeText(
                                                "\$${popularItems.price}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: globalFontSize*13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        width: width*0.15,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: width*0.02),
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: width*0.1,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: width*0.02),
                                              child: Icon(
                                                Icons.add,
                                                size: width*0.1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
}
