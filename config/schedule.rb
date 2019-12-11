# -*- encoding : utf-8 -*-
set :output, {:error => 'log/cron_tasks_errors.log', :standard => 'log/cron_tasks.log'}
set :job_template, "bash -l -c ':job'"
job_type :rake, "cd :path && NLS_LANG=AMERICAN_AMERICA.UTF8 RAILS_ENV=:environment bundle exec rake :task :output"

every 2.minutes do
  rake 'api_processor:call'
end