import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolliday_app/main.dart';
import 'package:yolliday_app/widgets/portfolio_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortfolioCardData {
  final String id;
  final String title;
  final String category;
  final String author;
  final String imageUrl;

  PortfolioCardData({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.imageUrl,
  });
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final List<PortfolioCardData> _allCards = [
    PortfolioCardData(
      id: '1',
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      imageUrl: 'assets/images/card_1.png',
    ),
    PortfolioCardData(
      id: '2',
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      imageUrl: 'assets/images/card_2.png',
    ),
    PortfolioCardData(
      id: '3',
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      imageUrl: 'assets/images/card_3.png',
    ),
    PortfolioCardData(
      id: '4',
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      imageUrl: 'assets/images/card_4.png',
    ),
    PortfolioCardData(
      id: '5',
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      imageUrl: 'assets/images/card_5.png',
    ),
  ];

  List<PortfolioCardData> _filteredCards = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _filteredCards = _allCards;
    _searchController.addListener(_filterCards);
  }

  void _filterCards() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCards = _allCards
          .where((card) => card.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.primaryOrange2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF303030),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/shopping_bag.svg',
              width: 16.w,
              height: 20.h,
              colorFilter:
              ColorFilter.mode(AppColors.primaryOrange2, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              width: 16.w,
              height: 19.5.h,
              colorFilter:
              ColorFilter.mode(AppColors.primaryOrange2, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  toolbarHeight: 0,
                  backgroundColor: AppColors.backgroundWhite,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: false,
                        labelColor: AppColors.primaryOrange2,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: AppColors.primaryOrange2,
                        indicatorWeight: 2.5,
                        labelStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                        tabs: const [
                          Tab(text: 'Project'),
                          Tab(text: 'Saved'),
                          Tab(text: 'Shared'),
                          Tab(text: 'Achievement'),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: _buildSearchBar(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildCardList(),
                const Center(child: Text('Saved Items (Empty)')),
                const Center(child: Text('Shared Items (Empty)')),
                const Center(child: Text('Achievements (Empty)')),
              ],
            ),
          ),
          Positioned(
            bottom: 35.h,
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                elevation: 6,
                shadowColor: AppColors.primaryOrange2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(24.r),
                child: Container(
                  width: 104.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange2,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    icon: const _FilterIcon(),
                    label: Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Center(
      child: SizedBox(
        width: 343.w,
        height: 44.h,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search a project',
            hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 16.sp),
            filled: true,
            fillColor: AppColors.lightGreyBackground,
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
              BorderSide(color: AppColors.borderColor, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: AppColors.primaryOrange2, width: 1.5.w),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(8.r),
              child: InkWell(
                onTap: _filterCards,
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange2,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardList() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 80.h),
      itemCount: _filteredCards.length,
      itemBuilder: (context, index) {
        final card = _filteredCards[index];
        return PortfolioCard(
          title: card.title,
          category: card.category,
          author: card.author,
          imageUrl: card.imageUrl,
        );
      },
    );
  }
}

class _FilterIcon extends StatelessWidget {
  const _FilterIcon();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLine(18.w),
          SizedBox(height: 3.h),
          _buildLine(12.w),
          SizedBox(height: 3.h),
          _buildLine(8.w),
        ],
      ),
    );
  }

  Widget _buildLine(double width) {
    return Container(
      width: width,
      height: 2.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}