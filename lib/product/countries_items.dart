class Country {
  final String country;
  final String flag;
  late final String getFlag = "assets/images/flags/$flag.png";

  Country({required this.country, required this.flag});
}

class CountryItems {
  List<Country> countries = [
    Country(country: "Azerbaijan", flag: "azerbaijan"),
    Country(country: "Canada", flag: "canada"),
    Country(country: "Turkey", flag: "turkey"),
    Country(country: "Bahamas", flag: "bahamas"),
    Country(country: "Argentina", flag: "argentina"),
    Country(country: "Angola", flag: "angola"),
    Country(country: "Brazil", flag: "brazil"),
    Country(country: "Netherlands", flag: "netherlands"),
    Country(country: "Luxembourg", flag: "luxembourg"),
    Country(country: "Kyrgyzstan", flag: "kyrgyzstan"),
    Country(country: "Kazakhstan", flag: "kazakhstan"),
    Country(country: "Israel", flag: "israel"),
    Country(country: "India", flag: "india"),
    Country(country: "Iceland", flag: "iceland"),
    Country(country: "Greece", flag: "greece"),
    Country(country: "Germany", flag: "germany"),
    Country(country: "Denmark", flag: "denmark"),
    Country(country: "Egypt", flag: "egypt"),
    Country(country: "England", flag: "england"),
    Country(country: "Belize", flag: "belize"),
    Country(country: "Bhutan", flag: "bhutan"),
    Country(country: "Burkina Faso", flag: "burkinaFaso"),
    Country(country: "Bulgaria", flag: "bulgaria"),
    Country(country: "Brunei", flag: "brunei"),
  ];
}
