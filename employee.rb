class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary

    if boss.nil?
      @boss = nil
    else
      @boss = boss
      boss.employees << self
    end
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    total_employee_salary = sub_employee_salary * multiplier
  end

  # private
  def sub_employee_salary
    sub_salary = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sub_salary += employee.salary + employee.sub_employee_salary
      else
        sub_salary += employee.salary
      end
    end
    sub_salary
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 1_000_000, nil)
  darren = Manager.new("Darren", "TA Manager", 78_000, ned)
  shawna = Employee.new("Shawna", "TA", 12_000, darren)
  david = Employee.new("David", "TA", 10_000, darren)
end

#ned = Manger.new(name, title, salary, boss)
#joe = Employee.new(name, title, salary, ned)
