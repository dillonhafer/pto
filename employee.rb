require 'faraday'
require 'date'

class Employee
  attr_accessor :user_id, :task_id, :start_date, :task_name

  def initialize(params={})
    @user_id    = params[:user_id]
    @task_id    = params[:task_id]
    @start_date = params[:start_date]
    @task_name  = params[:task_name]
  end

  def months_since_start
    months_since_start = ((Date.today - start_date).to_f / 30).to_i

    if months_since_start > 12
      months_since_start = 12
    end
    months_since_start
  end

  def hours_earned
    60*12*months_since_start
  end

  def update_time
    task_base       = "https://proworkflow6.net"
    task_uri        = "/BoondockWalker/api/v2/tasks.cfm?customerkey=QDA1-WI2E-ZIUX-FTFZ-PWFYJV6&api_call=edittask&UserID=#{user_id}"
    update_time_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><edittask><taskid>#{task_id}</taskid><taskassignedto>#{user_id}</taskassignedto><tasktimeallocated>#{hours_earned}</tasktimeallocated><taskjobid>957</taskjobid><tasktitle>#{task_name}</tasktitle></edittask>"

    conn = Faraday.new(url: task_base) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      #faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    # post payload as XML instead of "www-form-urlencoded" encoding:
    conn.post do |req|
      req.url task_uri
      req.headers['Content-Type'] = 'text/xml'
      req.body = update_time_xml
    end
  end
end
