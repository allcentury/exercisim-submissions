var compute = function(a, b) {
  var ctr = 0;
  for(var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      ctr = ctr += 1;
    }
  }
  return ctr;
};

module.exports.compute = compute;
