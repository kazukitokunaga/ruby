def to_hex(r, g, b)
    # injectメソッドは最初の繰り返しではhexに#が入る
    [r, g, b].inject('#') do |hex, n|
    # rjustは第1引数は桁数、第2引数は文字列
      hex + n.to_s(16).rjust(2, '0')
    end
  end
  
  def to_ints(hex)
    # mapメソッドは戻り値を配列の要素にして新しい配列を返す
    # &:メソッド名は「do |n| n.メソッド名」と同義。
    hex.scan(/\w\w/).map(&:hex)    # hex.scan(/\w\w/).map do |n| n.hex
  end
  