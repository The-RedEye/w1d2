require "employee"

class Startup
attr_reader :name, :funding, :salaries, :employees

def initialize(name, funding, salaries)
  @name = name
  @funding = funding
  @salaries  = salaries
  @employees = []
end

def valid_title?(str)
  if @salaries.has_key?(str)
    return true
  end
  false
end

def >(startup)
  if self.funding>startup.funding
    return true
  end
  false

  
end

def hire(name, title)
  if !valid_title?(title)
    raise error
  end

  @employees << Employee.new(name, title)
end

def size
  employees.length
end

def pay_employee(dude)
  salary = @salaries[dude.title]
  if @funding-salary<=0
    raise error
  else
    dude.pay(salary)
    @funding -= salary 
  end
end

def payday
  @employees.each {|employee| self.pay_employee(employee)}
end

#-------------part 3-------------

def average_salary
  sum = 0.0
  employees.each do |dude| 
    sum += salaries[dude.title]
  end
  sum /employees.length
end

def close
  @employees = []
  @funding = 0
end

def acquire (startup)
  @funding += startup.funding
  startup.salaries.each do | k, v|
    if !@salaries.has_key?(k)
      @salaries[k] = v
    end
  end

  startup.employees.each do |dude|
    @employees << dude
  end

  startup.close
end


end #end Startup Class
