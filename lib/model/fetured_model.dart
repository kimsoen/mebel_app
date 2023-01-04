class FeturedModel {
  final String harga;
  final String gambar;
  final String title;

  FeturedModel(
      {required this.harga, required this.gambar, required this.title});

  factory FeturedModel.fromJson(Map<String, dynamic> json) => FeturedModel(
        harga: json['harga'],
        gambar: json['gambar'],
        title: json['title'],
      );
}
