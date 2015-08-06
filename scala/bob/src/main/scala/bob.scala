class Bob {
  def hey(msg: String) : String = {
    var response = ""
    if(msg.map(_.toUpper) == msg && msg.matches("^.*[a-zA-Z].*$")) {
      response = "Woah, chill out!"
    }else if(msg.matches(".*\\?")) {
      response = "Sure."
    }else if(msg.trim == "") {
      response = "Fine. Be that way!"
    }else{
      response = "Whatever."
    }
    return response
  }
}
