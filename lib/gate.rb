# 改札機を表すクラス
class Gate
    STATIONS = [:umeda, :juso, :mikuni] # :nodoc:
    FARES = [150, 190] # :nodoc:
  
    # Gateオブジェクトの作成
    # ==== 引数
    # * +name+ - 駅名
    def initialize(name)
      @name = name
    end
  
    # 改札機を通って駅に入場する
    # ==== 引数
    # * +ticket+ - 切符
    def enter(ticket)
      ticket.stamp(@name)
    end
  
    # 改札機を通って駅から出場する
    # ==== 引数
    # * +ticket+ - 切符
    # ==== 戻り値
    # * +boolean+ - 運賃が足りていれば+true+、不足していれば+false+
    def exit(ticket)
      # calc_fareメソッドを呼び出し、料金を算定する。
      fare = calc_fare(ticket)
      # 購入したticket代金が、料金を上回っているか判定する。
      fare <= ticket.fare
    end
  
    private
  
    def calc_fare(ticket)
      # ticket.stamped_atには乗車駅が格納されている。
      from = STATIONS.index(ticket.stamped_at)
      # exitメソッドで呼ばれることを想定しているため、nameには降車駅が格納されているはず。  
      to = STATIONS.index(@name)
      # 降車駅のindexから乗車駅のindexを引く。例えば、mikuni - umeda だと2-0で2となる。
      distance = to - from
      # FARES配列のindex0には1駅分の料金が、1には2駅分の料金が格納されていることから、distance-1で値を取得する。
      FARES[distance - 1]
    end
  end
  