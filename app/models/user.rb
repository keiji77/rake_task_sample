class User < ApplicationRecord
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
              name: row["name"],
              age: row["age"],
              address: row["address"]
      }
    end

    puts "インポートを開始しました"

    #インポートができなかったときの例外処理
    begin
      User.create!(list)
      puts "インポートを完了しました"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗 :UnknownAttributeError"
    end

  end
end
