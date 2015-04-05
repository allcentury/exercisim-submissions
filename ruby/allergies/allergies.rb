class Allergies
  def initialize(score)
    @score = score
    @food_scores = {
      "eggs" => 1,
      "peanuts" =>  2,
      "shellfish" => 4,
      "strawberries" => 8,
      "tomatoes" => 16,
      "chocolate" => 32,
      "pollen" => 64,
      "cats" => 128
    }
  end

  def allergic_to?(food)
    return false if @score == 0
    @food_scores[food] <= @score
  end

  def list
    current_score = @score
    sorted_foods.each_with_object([]) do |(food, allergy_rating), results|
      if allergy_rating <= current_score
        results << food
        current_score -= allergy_rating
      end
    end.reverse
  end

  private

  def sorted_foods
    @food_scores.sort_by { |_, v| -v }
  end
end
