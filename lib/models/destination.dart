class Destination {
  String? image;
  String? name;
  String? description;

  Destination({
    this.image,
    this.name,
    this.description,
  });
}

final List<Destination> destinations = [
  Destination(
      image: 'assets/island hopping 1.jpg',
      name: 'Island Hopping',
      description:
          'Enjoy your exploration by being able to travel from one island to another island of Bien Unido.'),
  Destination(
      image: 'assets/underwater sto nino.png',
      name: 'Underwater Sto. Niño Statue',
      description:
          'Wanna try diving  and pray to the Sto. Niño Statue underwater? No worries, try it here in Bien Unido!'),
  Destination(
      image: 'assets/divecamp.jpg',
      name: 'DiveCamp Resort ',
      description:
          'Wanna try swimming into a pool connected to the sea? Yes? Come visit it here at Bien Unido Dive Camp Resort'),
  Destination(
      image: 'assets/sanbar.jpg',
      name: 'White SandBar',
      description:
          'Discover this beautiful White Sandbar of Bien Unido which is located in its baranggay - Tuburan'),
  Destination(
      image: 'assets/hingotanan.jpg',
      name: 'Hingotanan Island',
      description:
          'Hingotanan Island: Popularly known as The Small Paradise, Bien Unido, Philippines.'),
  Destination(
      image: 'assets/island front view resort.jpg',
      name: 'Island FrontView Resort',
      description:
          'Golden beaches and lush mountains, samba-fueled nightlife and spectacular football matches: welcome to the Cidade Maravilhosa (Marvelous City).'),
];
