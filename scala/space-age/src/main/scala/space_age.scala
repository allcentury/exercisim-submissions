class SpaceAge(input: Long) {
  def seconds: Long = input

  def onEarth: Double = round(onEarthPrecise)

  def onMercury: Double =  round(onEarthPrecise / 0.2408467)

  def onVenus: Double =  round(onEarthPrecise / 0.61519726)

  def onMars: Double = round(onEarthPrecise / 1.8808158)

  def onJupiter: Double = round(onEarthPrecise / 11.862615)

  def onSaturn: Double = round(onEarthPrecise / 29.447498)

  def onUranus: Double = round(onEarthPrecise / 84.016846)

  def onNeptune: Double = round(onEarthPrecise / 164.79132)

  def onEarthPrecise: Float = input.toFloat / 31557600

  def round(num: Double): Double = "%.2f".format(num).toDouble

}

object SpaceAge {
  def apply(seconds: Long) = new SpaceAge(seconds)
}
