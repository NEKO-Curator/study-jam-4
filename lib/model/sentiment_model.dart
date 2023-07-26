class Sentiment {
  final int score;
  final double comparative;
  final List<dynamic> calculation;
  final List<String> tokens;
  final List<String> words;
  final List<String> positive;
  final List<String> negative;

  Sentiment(
      {required this.score,
      required this.comparative,
      required this.calculation,
      required this.tokens,
      required this.words,
      required this.positive,
      required this.negative});

  factory Sentiment.fromJson(Map<String, dynamic> json) {
    return Sentiment(
      score: json['score'],
      comparative: json['comparative'].toDouble(),
      calculation: json['calculation'],
      tokens: List<String>.from(json['tokens']),
      words: List<String>.from(json['words']),
      positive: List<String>.from(json['positive']),
      negative: List<String>.from(json['negative']),
    );
  }
}
