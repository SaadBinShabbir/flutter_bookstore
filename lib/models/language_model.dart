class Language {
  final String code;
  final String name;
  final String flagAsset;
  final bool isSelected;

  const Language({
    required this.code,
    required this.name,
    required this.flagAsset,
    this.isSelected = false,
  });

  Language copyWith({
    String? code,
    String? name,
    String? flagAsset,
    bool? isSelected,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
      flagAsset: flagAsset ?? this.flagAsset,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  // Dummy data for languages
  static List<Language> dummyLanguages = [
    const Language(
      code: 'en',
      name: 'English',
      flagAsset: 'assets/flags/England.svg',
      isSelected: true, // English selected by default
    ),
    const Language(
      code: 'fr',
      name: 'France',
      flagAsset: 'assets/flags/france.svg',
    ),
    const Language(
      code: 'de',
      name: 'German',
      flagAsset: 'assets/flags/German.svg',
    ),
    const Language(
      code: 'hi',
      name: 'India',
      flagAsset: 'assets/flags/India.svg',
    ),
    const Language(
      code: 'it',
      name: 'Italy',
      flagAsset: 'assets/flags/Italy.svg',
    ),
  ];
}
