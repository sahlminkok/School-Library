require './person'

class Teacher < Person
  def initialize(_name, age, specialization)
    super('Unknown', age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
