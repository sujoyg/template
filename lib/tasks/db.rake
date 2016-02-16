namespace :db do
  desc 'Dumps the database'
  task :dump => :environment do
    with_config do |host, database, username, password|
      host = 'localhost' unless host.present?

      exec "mysqldump -h#{host} -u#{username} -p#{password} #{database}"
    end
  end

  private

  def with_config
    yield ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
  end
end
