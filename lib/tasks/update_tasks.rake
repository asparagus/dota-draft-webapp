namespace :update_tasks do
  desc "Download new matches and enter them into the database"
  task update_matches: do
    (1..10).each do |i|
      puts i
    end
  end

end
