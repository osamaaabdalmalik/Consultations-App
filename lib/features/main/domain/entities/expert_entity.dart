class Expert {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String? address;
  final String? about;
  final int rating;
  final int ratingNumber;
  final int consultanciesNumber;

  const Expert({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.rating,
    required this.ratingNumber,
    required this.consultanciesNumber,
  });
}
