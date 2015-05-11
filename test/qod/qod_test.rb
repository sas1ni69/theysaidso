require './test/test_helper'

class QODTest < Minitest::Test

  def test_exists
    assert Theysaidso::QOD
  end

  def test_it_gives_qod
    VCR.use_cassette('qod') do
      quote = Theysaidso::QOD.fetch
      assert_equal Theysaidso::QOD, quote.class

      assert_equal quote.success, 1
    end
  end
end
