var words = function(input) {
  var wordArray = input.split(/\s/),
      counts = {},
      current;
  for(var i = 0; i < wordArray.length; i++) {
    current = wordArray[i];

    if(counts[current]) {
      counts[current] = counts[current] + 1;
    } else {
      counts[current] = 1;
    }
  }
  return counts;
};

module.exports = words;
