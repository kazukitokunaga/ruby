# text入力する。
print 'Text?: '
# getsはターミナル上でのinputを行うメソッド。.chompはエンターキーを押したときに改行文字を入力しないメソッド。
text = gets.chomp

begin
# pattern入力する。
  print 'Pattern?: '
  pattern = gets.chomp
# 正規表現クラスのオブジェクトを生成
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

# 正規表現クラスのpatternとマッチした場合は「Matched」を表示する。
matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join(', ')}"
else
  puts "Nothing matched."
end
