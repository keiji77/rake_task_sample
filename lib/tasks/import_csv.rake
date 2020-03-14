namespace :import_csv do
  #rake import_csv:users
  desc "User CSVデータのインポート"

  task users: :environment do
    User.import('db/csv_data/csv_data.csv')
  end

end
