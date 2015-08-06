object HelloWorld {
  def hello(name: String = "empty") : String = {
    var msg = ""
    if(name == "empty") {
      msg = "Hello, world!"
    }else{
      msg = "Hello, " + name + "!"
    }
    return msg
  }
}
