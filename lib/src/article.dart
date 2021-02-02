class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  // Const constructor to denote this is an immutable object
  const Article({
    this.text,
    this.domain,
    this.by,
    this.age,
    this.score,
    this.commentsCount,
  });
}

final articles = [
  Article(
    text: "My YC app: Dropbox - Throw away your USB drive",
    domain: "google.com",
    by: "dhouston",
    age: "30",
    score: 84,
    commentsCount: 127,
  ),
  Article(
    text: "SpaCy 3.0",
    domain: "google.com",
    by: "Filip",
    age: "32",
    score: 49,
    commentsCount: 185,
  ),
  Article(
    text:
        "An unexpected find that freed 20gb of unused index space in PostgreSQL",
    domain: "google.com",
    by: "Andrew",
    age: "33",
    score: 72,
    commentsCount: 145,
  ),
  Article(
    text: "Secure your MQTT server with authentication and encryption",
    domain: "google.com",
    by: "Andrew",
    age: "35",
    score: 29,
    commentsCount: 186,
  ),
  Article(
    text: "Build a Raspberry Pi CM4 4-Bay NAS with Wiretrustee Carrier Board",
    domain: "google.com",
    by: "George",
    age: "36",
    score: 48,
    commentsCount: 129,
  ),
  Article(
    text: "Medieval Cambridge skeletons reveal injuries to manual labourers",
    domain: "google.com",
    by: "dhouston",
    age: "30",
    score: 84,
    commentsCount: 127,
  ),
  Article(
    text: "Slack’s Outage on January 4th 2021",
    domain: "google.com",
    by: "Filip",
    age: "32",
    score: 49,
    commentsCount: 185,
  ),
  Article(
    text: "gemini:// space",
    domain: "google.com",
    by: "Andrew",
    age: "33",
    score: 72,
    commentsCount: 145,
  ),
  Article(
    text: "Three-dimensional model of electricity consumption in Manchester",
    domain: "google.com",
    by: "Andrew",
    age: "35",
    score: 29,
    commentsCount: 186,
  ),
  Article(
    text: "A simple ray tracer in Lean 4",
    domain: "google.com",
    by: "George",
    age: "36",
    score: 48,
    commentsCount: 129,
  ),
  Article(
    text: "Show HN: Deploy ML Models on a Budget",
    domain: "google.com",
    by: "dhouston",
    age: "30",
    score: 84,
    commentsCount: 127,
  ),
  Article(
    text: "Ask HN: Recommended books and papers on distributed systems?",
    domain: "google.com",
    by: "Filip",
    age: "32",
    score: 49,
    commentsCount: 185,
  ),
  Article(
    text:
        "Odeko (YC S19) is hiring Senior Engineers – join our distributed team",
    domain: "google.com",
    by: "Andrew",
    age: "33",
    score: 72,
    commentsCount: 145,
  ),
  Article(
    text: "Advanced iOS",
    domain: "google.com",
    by: "Andrew",
    age: "35",
    score: 29,
    commentsCount: 186,
  ),
  Article(
    text: "iOS Basics",
    domain: "google.com",
    by: "George",
    age: "36",
    score: 48,
    commentsCount: 129,
  ),
];
