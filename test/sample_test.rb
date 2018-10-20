require 'minitest/autorun'
require './fizz_buzz'

class SampleTest < Minitest::Test
    def test_sample
        # aとbが等しければパスする
        assert_equal b,a

        # aが真であればパスする
        assert a

        # aが偽であればパスする
        refute a
    end
end