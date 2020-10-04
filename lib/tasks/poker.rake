namespace :poker do
  desc "Starts poker"
  task :start => :environment do
    result = NewPlanning.call({
      :name => "Planning ##{Planning.count + 1}"
    })

    if result.success?
      puts "\033[0;32mPoker started now\033[0m"
    else
      puts "\033[0;31m#{result.error}\033[0m"
    end
  end

  desc "Votes poker"
  task :vote => :environment do
    planning = Planning.current

    puts "\033[0;33m#{planning.name}\033[0m\n\n"

    if planning.present?
      users = User.all

      progressbar = ProgressBar.create({
        :total          => users.count,
        :format         => "%a %b\u{15E7}%i %p%% %t [%c out of %C votes added]]",
        :progress_mark  => ' ',
        :remainder_mark => "\u{FF65}"
      })

      users.all.each_with_index do |user, index|
        puts "\033[0;32m#{user.name}, cast your vote:\033[0m\n\n"

        result = CastVote.call({
          :user     => user,
          :planning => planning,
          :rating   => STDIN.gets.to_i
        })

        if result.success?
          puts "\033[0;32mThe vote was approved...\033[0m\n\n"
        else
          puts "\033[0;31m#{result.error}\033[0m\n\n"
        end

        progressbar.increment
      end

      result = GenerateReport.call(planning: planning)

      if result.success?
        puts "\033[0;34mFinal note: #{result.report['rating']}\033[0m\n\n"

        result.report['votes'].each do |rating, users|
          puts "\033[0;34m#{rating}: #{users.join(', ')}\033[0m\n"
        end
      else
        puts "\033[0;31mNo report\033[0m\n\n"
      end
    else
      puts "\033[0;31mNo current planning...\033[0m"
    end
  end
end
