require_relative 'employee'

employees = []

# Dillon
employees << Employee.new({
  user_id: 606,
  task_id: 9943,
  start_date: Date.parse('2013-10-01'),
  task_name: 'Dillon PTO 2014'
})
employees << Employee.new({
  user_id: 606,
  task_id: 9944,
  start_date: Date.parse('2012-10-01'),
  task_name: 'Dillon PTO 2013'
})

# Seth
employees << Employee.new({
  user_id: 618,
  task_id: 9945,
  start_date: Date.parse('2013-07-01'),
  task_name: 'Seth PTO 2014'
})
employees << Employee.new({
  user_id: 618,
  task_id: 9946,
  start_date: Date.parse('2013-07-01'),
  task_name: 'Seth PTO 2013'
})

# Dani

employees.each do |employee| 
  employee.update_time
  puts "Set hours for #{employee.task_name} to: #{employee.hours_earned / 60}"
end
