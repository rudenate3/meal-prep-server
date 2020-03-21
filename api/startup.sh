bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate

rails s -b 0.0.0.0