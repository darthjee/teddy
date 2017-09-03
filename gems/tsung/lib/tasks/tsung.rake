namespace :tsung do
  desc 'Install tsung'
  task :install, [:user_class] => [:environment] do |task, args|
    user_class = args[:user_class]

    if user_class
      user_class = user_class.split('/').map(&:camelize).join('::')
      user_class_path = user_class.split('::').map(&:underscore).join('/')
      user_table = user_class_path.gsub('/','_').pluralize

      puts user_class
      puts user_class_path
      puts user_table
    else
      puts "Usage: rake task #{task}[user_class]"
    end
  end
end
