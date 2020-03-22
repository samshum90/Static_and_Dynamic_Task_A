
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../card')
# require_relative('../card_game')
require_relative('../testing_task_2')

class CardGameTest < Minitest::Test

  def setup()
    @ace_of_spades = Card.new("Spades", 1)
    @three_of_hearts = Card.new('Hearts', 3)
    @king_of_clubs = Card.new('clubs', 13)
    @cards = [@three_of_hearts, @king_of_clubs, @ace_of_spades]
    @card_game = CardGame.new()
  end

  def test_check_for_ace_true()
    assert_equal(true, @card_game.check_for_ace(@ace_of_spades))
  end

  def test_check_for_ace_false()
    assert_equal(false, @card_game.check_for_ace(@three_of_hearts))
  end

  def test_highest_card_1st()
    assert_equal(@king_of_clubs, @card_game.highest_card(@king_of_clubs, @three_of_hearts))
  end

  def test_highest_card_2nd()
    assert_equal(@king_of_clubs, @card_game.highest_card(@three_of_hearts, @king_of_clubs))
  end

  def test_card_total()
    assert_equal("You have a total of 17", CardGame.cards_total(@cards) )
  end

end
