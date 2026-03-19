class MatchScout {
  int teamNumber;
  int autoPiece
  int teleopPieces;
  bool climbed;
  String comments;

  MatchScout ( {
    required this.teamNumber,
    required this.autoPiece,
    required this.teleopPieces,
    required this.climbed,
    required this.comments,
  });

  // This function turns the data into a "Compressed String" for the QR Code
  String toQrString() {
    return "$teamNumber|$autoPieces|$teleopPieces|${climbed ? 1 : 0}|$commernts";
  }
}
void main () {
  //testing the logic
  var testMatch = MatchScout(
    team number: 2080,
    autoPieces: 3,
    teleopPieces: 12,
    climbed: true,
    comments: "Fast cycles",
    );
  print("QR Data to scan: $ {testMatch.toQrString()}");
}
