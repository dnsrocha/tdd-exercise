# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0
  hand.each do |card|
    unless VALID_CARDS.include?(card)
      raise ArgumentError.new("#{card} is an invalid card.")
    end

    if card == "Jack" || card == "Queen" || card == "King"
      score += 10
    elsif card.to_i <= 10 && card.to_i >= 2
      score += card
    end
  end

  hand.each do |card|
    if card == "Ace"
      if score <= 10
        score += 11
      else
        score += 1
      end
    end
  end

  if score > 21
    raise ArgumentError.new("Bust Hand (#{score.to_i}). You lost.")
  end

  return score
end