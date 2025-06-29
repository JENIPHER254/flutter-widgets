import 'package:flutter/material.dart';
import '../../widgets/drawer/drawer.dart';

class ExploreBooks extends StatefulWidget {
  @override
  State<ExploreBooks> createState() => _ExploreBooksState();
}

class _ExploreBooksState extends State<ExploreBooks> {
  final List<String> categories = [
    'ALL',
    'DESIGN',
    'TECHNOLOGY',
    'TRAVEL',
    'SPORTS',
    'HEALTH'
  ];
  int selectedCategory = 0;
  String searchQuery = '';

  final Map<String, List<Map<String, String>>> categoryContent = {
    'DESIGN': [
      {
        'title': 'Minimalist workspace setup ideas for productivity',
        'subtitle': 'Organize your desk for better focus.',
        'image':
            'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': 'Vintage interior design styles',
        'subtitle': 'Revive classic home designs.',
        'image':
            'https://images.unsplash.com/photo-1519710164239-da123dc03ef4?auto=format&fit=crop&w=200&q=80',
      },
    ],
    'TECHNOLOGY': [
      {
        'title': 'AI advancements in 2025',
        'subtitle': 'Explore what AI can do today.',
        'image':
            'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': 'Top programming languages to learn',
        'subtitle': 'Stay ahead in tech.',
        'image':
            'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=200&q=80',
      },
    ],
    'TRAVEL': [
      {
        'title': 'Hidden gems of East Africa',
        'subtitle': 'Explore less-known but beautiful destinations.',
        'image':
            'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': 'Europe on a budget',
        'subtitle': 'How to travel cheap.',
        'image':
            'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?auto=format&fit=crop&w=200&q=80',
      },
    ],
    'SPORTS': [
      {
        'title': 'Top 10 football moments of the year',
        'subtitle': 'Goals, glory, and drama.',
        'image':
            'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': 'Benefits of playing tennis',
        'subtitle': 'Stay fit and have fun.',
        'image':
            'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?auto=format&fit=crop&w=200&q=80',
      },
    ],
    'HEALTH': [
      {
        'title': 'Healthy meal prep ideas',
        'subtitle': 'Easy, tasty, and good for you.',
        'image':
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': 'Yoga for beginners',
        'subtitle': 'Start your wellness journey.',
        'image':
            'https://images.unsplash.com/photo-1552058544-f2b08422138a?auto=format&fit=crop&w=200&q=80',
      },
    ],
  };

  List<Map<String, String>> getFilteredContent() {
    List<Map<String, String>> allItems = [];
    if (selectedCategory == 0) {
      categoryContent.forEach((_, value) => allItems.addAll(value));
    } else {
      allItems = categoryContent[categories[selectedCategory]] ?? [];
    }
    if (searchQuery.isNotEmpty) {
      return allItems.where((item) {
        return item['title']!
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            item['subtitle']!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
    return allItems;
  }

  @override
  Widget build(BuildContext context) {
    final items = getFilteredContent();

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              color: const Color(0xFF353649),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      child: Row(
                        children: [
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () => Scaffold.of(context).openDrawer(),
                              child: Icon(Icons.menu,
                                  color: Color(0xFF353649), size: 24),
                            ),
                          ),
                          Spacer(),
                          Stack(
                            children: [
                              Icon(Icons.notifications_none,
                                  color: Color(0xFF353649), size: 26),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF36F8F),
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 45, bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12), // optional inner spacing
                            decoration: BoxDecoration(
                              color: Color(0xFF414255),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                    color: Colors.white54, size: 20),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (value) {
                                      setState(() {
                                        searchQuery = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isCollapsed:
                                          true, // 👈 Ensures no extra internal padding
                                      hintText: 'Search anything here',
                                      hintStyle: TextStyle(
                                          color: Colors.white38, fontSize: 14),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets
                                          .zero, // 👈 No extra padding
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4A261),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:
                              Icon(Icons.tune, color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 16),
                    child: Row(
                      children: [
                        _TabButton(text: 'LEARNING PATH', selected: true),
                        SizedBox(width: 18),
                        _TabButton(text: 'BOOK PARADISE ', selected: false),
                        Spacer(),
                        Icon(Icons.more_horiz, color: Colors.white54, size: 22),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: _CategoryChip(
                      categories[index],
                      selected: selectedCategory == index,
                    ),
                  );
                }),
              ),
            ),

            // List of Cards
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: items.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.builder(
                        key: ValueKey<int>(selectedCategory),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return FadeIn(
                            delay: Duration(milliseconds: 100 * index),
                            child: _CategoryCard(
                              title: item['title']!,
                              subtitle: item['subtitle']!,
                              imageUrl: item['image']!,
                              category: selectedCategory == 0
                                  ? 'ALL'
                                  : categories[selectedCategory],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool selected;
  const _TabButton({required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 15,
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(height: 2),
        Container(
          height: 2,
          width: selected ? 28 : 0,
          color: selected ? Colors.white : Colors.transparent,
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title, subtitle, imageUrl, category;

  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(14)),
            child: Image.network(
              imageUrl,
              height: 65,
              width: 65,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Color(0xFF353649),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.favorite_border, color: Colors.grey[400]),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

Widget _CategoryChip(String label, {required bool selected}) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: AnimatedScale(
      duration: Duration(milliseconds: 300),
      scale: selected ? 1.1 : 1.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF353649) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    ),
  );
}

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeIn({required this.child, this.delay = Duration.zero});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _offset = Tween<Offset>(begin: Offset(0, 0.05), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
