import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/language_model.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  List<Language> languages = Language.dummyLanguages;
  String searchQuery = '';

  List<Language> get filteredLanguages {
    if (searchQuery.isEmpty) {
      return languages;
    }
    return languages.where((language) =>
        language.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
  }

  void _selectLanguage(String languageCode) {
    setState(() {
      languages = languages.map((language) {
        return language.copyWith(isSelected: language.code == languageCode);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            "assets/icons/Arrow - Left.svg",
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          "Language",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select your preferred language",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You will use the same language throughout the app.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search your language",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                    borderSide: const BorderSide(color: primaryColor, width: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = filteredLanguages[index];
                  return LanguageListItem(
                    language: language,
                    onTap: () => _selectLanguage(language.code),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultBorderRadious),
                      ),
                    ),
                    child: Text(
                      "Done",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageListItem extends StatelessWidget {
  const LanguageListItem({
    super.key,
    required this.language,
    required this.onTap,
  });

  final Language language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: language.isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          border: Border.all(
            color: language.isSelected ? primaryColor : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              language.flagAsset,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                language.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: language.isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (language.isSelected)
              SvgPicture.asset(
                "assets/icons/Singlecheck.svg",
                height: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
