import 'package:equatable/equatable.dart';

class ArticleData extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const ArticleData(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.authorImageUrl,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt});

  static List<ArticleData> articles = [
    ArticleData(
        id: '1',
        title: 'Wanna Play with Some Virtual Reality?',
        subtitle:
            'The maker of the famed iPhone has not yet announced any of its MR range, but rumors around its launch around the early bit this year, are rife.',
        body:
            'Apple Inc. had been in talks with Walt Disney earlier, for developing Virtual Reality content to be used on its MR headset as per Bloomberg reports. It is estimated for Apple to make sales of a million units in the very first year. The California-based tech giant is not planning on a profit for this initial version though. The report also stated how Apple was working for synchronising its Apple TV+ with this MR headset',
        author: 'satarupa B.',
        authorImageUrl:
            'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=578&q=80',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        views: 4950,
        createdAt: DateTime.now().subtract(const Duration(hours: 6))),
    ArticleData(
      id: '2',
      title: 'በታኅሣሥ ወር ብቻ 2 ቢሊዮን የዓለም ሕዝብ በየቀኑ ፌስቡክ ተጠቅሟል',
      subtitle:
          'ግዙፉን የማኅበራዊ ትስስር መድረክ ፌስቡክን የሚጠቀመው የዓለም ሕዝብ ቁጥር ከታኅሣሥ ወር ጀምሮ በአማካይ 2 ቢሊዮን መድረሱ ተነገረ',
      body:
          'ይህ ከፍተኛ የተጠቃሚዎች ቁጥር የፌስቡክ ባለቤት የሆነው ሜታ ኩባንያን ከቅርብ ጊዜ ወዲህ ከደረሰበት የፋይናንስ ቀውስ ሊታደገው ይችላል ተብሏል።ኩባንያው ካለፈው የፈረንጆች ዓመት ወዲህ የማስታወቂያ ገቢው እየቀነሰ ጠቅላላ ኩባንያውን ለማስተዳደር የሚያወጣው ወጪ ደግሞ እየጨመረ መጠነኛ ችግር ውስጥ ገብቶ እንደነበር ይታወሳል።',
      author: 'BBBC NEWS',
      authorImageUrl:
          'https://images.unsplash.com/photo-1594670297948-e910d5964979?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=835&q=80',
      category: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1432888622747-4eb9a8efeb07?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',
      views: 2345,
      createdAt: DateTime.now().subtract(const Duration(hours: 10)),
    ),
    ArticleData(
        id: '3',
        title: 'Health benefits and risks of chocolate',
        subtitle:
            'The next time you eat a piece of chocolate, you may not have to feel so guilty about it',
        body:
            'Chocolate is made from tropical Theobroma cacao tree seeds. Its earliest use dates back to the Olmec civilization in Mesoamerica Chocolate is made from tropical Theobroma cacao tree seeds. Its earliest use dates back to the Olmec civilization in Mesoamerica',
        author: 'Natali Butler',
        authorImageUrl:
            'https://images.unsplash.com/photo-1516658273235-6f3ff3b414d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1505253304499-671c55fb57fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        views: 6700,
        createdAt: DateTime.now().subtract(const Duration(hours: 8))),
    ArticleData(
        id: '4',
        title: 'Iranian women are fighting for their rights.',
        subtitle:
            'There is  actually been a very long history of women advocating for the role of women in Iran and for having freedom Pardis Mahdavi, a provost and executive vice president of the University of Montana tells ABC RN s Rear Vision',
        body:
            'We have seen Islamic feminism we have seen more secular feminism we have seen multiple generations of feminists and these have actually laid the important groundwork for what we see on the streets of Iran today For more than a century the place of women in Iran has been a seismic political cultural and religious issue. And women have responded time and time again by making their voices heard',
        author: 'Nick Baker',
        authorImageUrl:
            'https://images.unsplash.com/photo-1669077555392-d97ce810d321?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
        category: 'politics',
        imageUrl:
            'https://images.unsplash.com/photo-1667089243251-8871a01d1ab4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        views: 547,
        createdAt: DateTime.now().subtract(const Duration(hours: 9))),
    ArticleData(
        id: '5',
        title: 'Scientists Have Created a Robot That Can Laugh With You',
        subtitle:
            'In the shared-laughter model, a human initially laughs and the AI system responds with laughter as an empathetic response. This approach required designing three subsystems – one to detect laughter, a second to decide whether to laugh and a third to choose the type of appropriate laughter.',
        body:
            'We think that one of the important functions of conversational AI is empathy,” explained lead author Dr. Koji Inoue, an assistant professor at Kyoto University in the Department of Intelligence Science and Technology within the Graduate School of Informatics. “Conversation is, of course, multimodal, not just responding correctly. So we decided that one way a robot can empathize with users is to share their laughter, which you cannot do with a text-based chatbot.',
        author: 'Frontiers',
        authorImageUrl:
            'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        views: 601,
        createdAt: DateTime.now().subtract(const Duration(hours: 10))),
    ArticleData(
        id: '6',
        title: 'Android 12 is here! Check features and compatible devices',
        subtitle:
            'Android 12 has been launched by Google and its features are just amazing. Read the blog below to learn more.',
        body:
            'Google follows a pattern, in case you didn’t notice before! And this year was no different. In the first few months of the year, it launches developer previews. The initial Android 12 developer preview rolled out on 18 February 2021, followed by the second Android 12 developer preview release on 17 March 2021. Going forward, the search giant will host its annual Google IO 2021 event, where it is likely to roll out the first Android 12 beta version for users. The beta release date can be anywhere between May 18 to 20.',
        author: 'Manish',
        authorImageUrl:
            'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        views: 18950,
        createdAt: DateTime.now().subtract(const Duration(hours: 7))),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt,
      ];
}
