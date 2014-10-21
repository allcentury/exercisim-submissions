var anagram = function(word) {
  var knownWords = function(availWords) {
    var array = ['hi'],
    perms = [];

    for (var i; i < word.length; i++) {
      if (i == 0) {
        var newWord = word.split("");
      }
      var last = newWord.pop;
      newWord.push(last);
      perms.push(newWord.join(''));
    }

    return perms;
  }
  return {
    matches: function(wordList) {
      return knownWords(wordList);
    }
  }
}
module.exports = anagram;
