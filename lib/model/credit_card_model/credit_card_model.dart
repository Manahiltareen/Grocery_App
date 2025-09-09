class CardModel {
  final String id;   // ✅ Firebase document id
  final String cardType;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolder;
  final bool isDefault;

  CardModel({
    this.id = '',
    required this.cardType,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolder,
    this.isDefault = false,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardType: map['cardType'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
      cvv: map['cvv'] ?? '',
      cardHolder: map['cardHolder'] ?? '',
      isDefault: map['isDefault'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardType': cardType,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'cardHolder': cardHolder,
      'isDefault': isDefault,
    };
  }


  CardModel copyWith({String? id}) {
    return CardModel(
      id: id ?? this.id,
      cardType: cardType,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
      cardHolder: cardHolder,
      isDefault: isDefault,
    );
  }
}
