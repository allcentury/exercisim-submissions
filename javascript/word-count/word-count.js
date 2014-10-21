var words = function(input) {
  var wordArray = input.split(/\s/),
      counts = {};

  wordArray.forEach(function(word) {
    counts[word] = counts[word] ? counts[word]++  : 1;
  });

  return counts;
};

module.exports = words;
