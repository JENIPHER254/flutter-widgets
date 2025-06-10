import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart'; // Import this for CarouselSliderController
import 'package:learner/widgets/drawer/drawer.dart';

// ...rest of your code remains unchanged

// 1. Create a Movie model class for better data structure
class Movie {
  final String title;
  final String image;
  final String description; // Using this for Author
  final double rating;
  final String duration; // Using this for Country

  const Movie({
    required this.title,
    required this.image,
    required this.description,
    this.rating = 0.0, // Default rating
    this.duration = 'N/A', // Default duration
  });
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController(); // Use CarouselController

  int _current = 0;

  // Use the Movie model for the _books list
  final List<Movie> _books = const [
    Movie(
      title: 'Things Fall Apart',
      image: 'assets/images/african/1.jpg',
      description: 'Chinua Achebe',
      rating: 9.2,
      duration: 'Nigeria',
    ),
    Movie(
      title:
          'Wise Words from a Legend', // Assuming this is an existing placeholder or specific title
      image: 'assets/images/african/2.jpg',
      description: 'Jenipher A. Onyango',
      rating: 8.7,
      duration: 'Kenya',
    ),
    Movie(
      title: 'Half of a Yellow Sun',
      image: 'assets/images/african/5.jpg', // Changed to 3.jpg
      description: 'Chimamanda Ngozi Adichie',
      rating: 8.9,
      duration: 'Nigeria',
    ),
    Movie(
      title: 'Nervous Conditions',
      image: 'assets/images/african/01.jpg',
      description: 'Tsitsi Dangarembga',
      rating: 8.5,
      duration: 'Zimbabwe',
    ),
    Movie(
      title: 'A Grain of Wheat',
      image: 'assets/images/african/02.jpg',
      description: 'Ngũgĩ wa Thiong\'o',
      rating: 8.8,
      duration: 'Kenya',
    ),
    Movie(
      title: 'So Long a Letter',
      image: 'assets/images/african/03.jpg',
      description: 'Mariama Bâ',
      rating: 8.4,
      duration: 'Senegal',
    ),
    Movie(
      title: 'Disgrace',
      image: 'assets/images/african/6.jpg',
      description: 'J. M. Coetzee',
      rating: 8.6,
      duration: 'South Africa',
    ),
    Movie(
      title: 'Homegoing',
      image: 'assets/images/african/04.jpg',
      description: 'Yaa Gyasi',
      rating: 9.1,
      duration: 'Ghana/USA',
    ),
    Movie(
      title: 'Americanah',
      image: 'assets/images/african/05.jpg',
      description: 'Chimamanda Ngozi Adichie',
      rating: 9.0,
      duration: 'Nigeria',
    ),
    Movie(
      title: 'The Secret Lives of Baba Segi\'s Wives',
      image: 'assets/images/african/06.jpg',
      description: 'Lola Shoneyin',
      rating: 7.9,
      duration: 'Nigeria',
    ),
    Movie(
      title: 'Wizard of the Crow',
      image: 'assets/images/african/07.jpg',
      description: 'Ngũgĩ wa Thiong\'o',
      rating: 8.2,
      duration: 'Kenya',
    ),
    Movie(
      title: 'My Sister, the Serial Killer',
      image: 'assets/images/african/1.jpg',
      description: 'Oyinkan Braithwaite',
      rating: 7.7,
      duration: 'Nigeria',
    ),
    Movie(
      title: 'The Joys of Motherhood',
      image: 'assets/images/african/02.jpg',
      description: 'Buchi Emecheta',
      rating: 8.3,
      duration: 'Nigeria',
    ),
    Movie(
      title: 'We Need New Names',
      image: 'assets/images/african/03.jpg',
      description: 'NoViolet Bulawayo',
      rating: 8.0,
      duration: 'Zimbabwe',
    ),
    Movie(
      title: 'Kintu',
      image: 'assets/images/african/12.jpg',
      description: 'Jennifer Nansubuga Makumbi',
      rating: 8.7,
      duration: 'Uganda',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Background image
            // Ensure _current is a valid index before accessing _books
            if (_books.isNotEmpty)
              Image.asset(
                _books[_current].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    // Adjusted gradient for a smoother fade
                    colors: [
                      Colors.grey.shade50.withOpacity(1.0),
                      Colors.grey.shade50.withOpacity(1.0),
                      Colors.grey.shade50.withOpacity(0.8),
                      Colors.grey.shade50.withOpacity(0.5),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            // Carousel
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _books.length,
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final movie = _books[index];
                  return MovieCard(
                    movie: movie,
                    isCurrent: _current == index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Extracted MovieCard widget
class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isCurrent;

  const MovieCard({Key? key, required this.movie, required this.isCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.description, // This is now the Author
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isCurrent ? 1.0 : 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors
                              .amber, // Changed to amber for better visibility
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          movie.rating.toString(),
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons
                              .location_on, // Changed icon to represent country
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          movie.duration, // This is now the Country
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility, // Changed to eye icon for "View"
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'View', // Changed "Watch" to "View"
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
