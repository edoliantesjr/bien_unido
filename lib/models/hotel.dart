class Hotel {
  String? image;
  String? name;
  String? description;

  Hotel({
    this.image,
    this.name,
    this.description,
  });
}

final List<Hotel> hotel = [
  Hotel(
      image: 'assets/jao bay resorts.jpg',
      name: 'Jao Bay Resort',
      description:
          "Spend your night stay at Bien Unido's nearby island inn- Jao Bay. Many tourist prefer to stay in Jao Bay resort, they say the nights in there is peaceful. Peaceful night is good night sleep!"),
  Hotel(
      image: 'assets/Nichos islan resort.jpg',
      name: 'Nichos Island Resort',
      description:
          "Situated at Suba, jao Island. During your stay at Nichos Island Resort, you'll be close to Carlos P Garcia Park. Freebies such as free WiFi in public areas, plus a restaurant and a bar. This 3-star hotel has 5 rooms."),
  // Hotel(
  //     image: 'assets/island hopping 1.jpg',
  //     name: 'Island Hopping',
  //     description:
  //         'You\'ll have seen a thousand photographs of the Pyramids of Giza by'
  //         ' the time you finally get here, but nothing beats getting'
  //         ' up-close-and-personal with these ancient monuments. Egypt\'s most'
  //         ' famed and feted structures, these ancient tombs of kings guarded by'
  //         ' the serene Sphinx have wowed spectators for centuries.'),
];
