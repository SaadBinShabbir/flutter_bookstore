// For demo only
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: "assets/images/AtomicHabits.png",
    title: "Atomic Habits",
    brandName: "James Clear",
    price: 18.99,
  ),
  ProductModel(
    image: "assets/images/RichDadPoorDad.png",
    title: "Rich Dad Poor Dad",
    brandName: "Robert Kiyosaki",
    price: 14.50,
  ),
  ProductModel(
    image: "assets/images/TheAlchemist.png",
    title: "The Alchemist",
    brandName: "Paulo Coelho",
    price: 16.00,
  ),
  ProductModel(
    image: "assets/images/ThinkandGrowRich.png",
    title: "Think and Grow Rich",
    brandName: "Napoleon Hill",
    price: 13.99,
  ),
  ProductModel(
    image: "assets/images/ThePowerofHabit.png",
    title: "The Power of Habit",
    brandName: "Charles Duhigg",
    price: 15.99,
  ),
  ProductModel(
    image: "assets/images/DeepWork.png",
    title: "Deep Work",
    brandName: "Cal Newport",
    price: 17.50,
  ),
];
List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image: "assets/images/Ikigai.png",
    title: "Ikigai",
    brandName: "Hector Garcia",
    price: 15.99,
    priceAfetDiscount: 11.99,
    dicountpercent: 25,
  ),
  ProductModel(
    image: "assets/images/ThePsychologyofMoney.png",
    title: "The Psychology of Money",
    brandName: "Morgan Housel",
    price: 16.99,
    priceAfetDiscount: 12.99,
    dicountpercent: 24,
  ),
  ProductModel(
    image: "assets/images/Sapiens.png",
    title: "Sapiens",
    brandName: "Yuval Noah Harari",
    price: 18.99,
    priceAfetDiscount: 14.99,
    dicountpercent: 21,
  ),
];
List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: "assets/images/7HabitsofHighlyEffectivePeople.png",
    title: "7 Habits of Highly Effective People",
    brandName: "Stephen Covey",
    price: 19.99,
  ),
  ProductModel(
    image: "assets/images/TheSubtleArtofNotGivingaFck.png",
    title: "The Subtle Art of Not Giving a F*ck",
    brandName: "Mark Manson",
    price: 16.99,
  ),
  ProductModel(
    image: "assets/images/Educated.png",
    title: "Educated",
    brandName: "Tara Westover",
    price: 15.99,
  ),
];
List<ProductModel> kidsProducts = [
  ProductModel(
    image: "assets/images/Can'tHurtMe.png",
    title: "Can't Hurt Me",
    brandName: "David Goggins",
    price: 20.99,
    priceAfetDiscount: 16.99,
    dicountpercent: 19,
  ),
  ProductModel(
    image: "assets/images/Man’sSearchforMeaning.png",
    title: "Man’s Search for Meaning",
    brandName: "Viktor E. Frankl",
    price: 18.50,
  ),
  ProductModel(
    image: "assets/images/The5AMClub.png",
    title: "The 5 AM Club",
    brandName: "Robin Sharma",
    price: 22.00,
    priceAfetDiscount: 17.60,
    dicountpercent: 20,
  ),
  ProductModel(
    image: "assets/images/MakeYourBed.png",
    title: "Make Your Bed",
    brandName: "William H. McRaven",
    price: 16.99,
  ),
  ProductModel(
    image: "assets/images/TheFourAgreements.png",
    title: "The Four Agreements",
    brandName: "Don Miguel Ruiz",
    price: 14.75,
    priceAfetDiscount: 11.80,
    dicountpercent: 20,
  ),
  ProductModel(
    image: "assets/images/HowtoWinFriends&InfluencePeople.png",
    title: "How to Win Friends & Influence People",
    brandName: "Dale Carnegie",
    price: 19.99,
  ),
];
