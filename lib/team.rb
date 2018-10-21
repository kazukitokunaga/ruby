require './lib/deep_freezable'

class Team
# DeepFreezableモジュールをextend
  extend DeepFreezable
# 大文字の宣言は定数。deep_freeze()で配列の各要素をfreeze
  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end
