class PhoneNumber(dirty_num: String) {
  def number: String = {
    var nums = dirty_num.filter(_.isDigit)
    if (nums.length == 11) {
      if (nums.startsWith("1")) {
          nums = nums.drop(1)
      } else {
        nums = "0000000000"
      }
    } else if (nums.length == 9) {
      nums = "0000000000"
    }
    return nums
  }

  def areaCode: String = {
    number.slice(0, 3)
  }

  def localCode: String = {
    number.slice(3, 6)
  }

  def userCode: String = {
    number.slice(6, 10)
  }

  override def toString: String = {
    s"($areaCode) $localCode-$userCode"
  }
}
