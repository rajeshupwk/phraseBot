namespace :phrase do
  desc "To create phrase"
  task :create_phrase, [:number] => [:environment] do |t, args|
    args.number.to_i.times do 
      FactoryGirl.create(:phrase)
    end
  end
end
