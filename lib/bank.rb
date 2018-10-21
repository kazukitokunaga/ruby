require './lib/deep_freezable'

class Bank
# DeepFreezableモジュールをextend
  extend DeepFreezable
# 大文字の宣言は定数。deep_freeze()で配列の各要素をfreeze
  CURRENCIES = deep_freeze({ 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' })
end
