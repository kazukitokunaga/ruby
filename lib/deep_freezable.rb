module DeepFreezable
    def deep_freeze(array_or_hash)
      case array_or_hash
      when Array
        array_or_hash.each do |element|
        # 配列の各要素をfreeze
          element.freeze
        end
      when Hash
        array_or_hash.each do |key, value|
        # ハッシュのキーとバリューをfreeze
          key.freeze
          value.freeze
        end
      end
      array_or_hash.freeze
    end
  end
  