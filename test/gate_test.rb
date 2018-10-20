require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test
  def setup
    # Gateクラスのinitializeメソッドで宣言したnameにシンボルを引数として渡す。
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_umeda_to_juso
    # Ticketクラスのinitializeメソッドで宣言したfareに引数を渡す。
    ticket = Ticket.new(150)
    # umedaから乗車するので、Gateクラスのenterメソッドにticketを渡す。
    # そうすると、Gateクラスで宣言したenterメソッドが、Ticketクラスのstampメソッドを呼び出し、乗車駅名nameを引数として渡す。
    # Ticketクラスのstampメソッドがインスタンス変数stamp_atに乗車駅名nameを代入する。
    @umeda.enter(ticket)
    # Gateクラスのexitメソッドにticketを渡す。
    # assertは、引数が true の時何もせず、false の時異常を出してプログラムを終了させる。
    assert @juso.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    # refuteは、引数が false の時何もせず、true の時異常を出してプログラムを終了させる。
    refute @mikuni.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_juso_to_mikuni
    ticket = Ticket.new(150)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
