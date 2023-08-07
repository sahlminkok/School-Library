require './person'

class Student < Person
  def initialize(_name, age, _parent_permission, classroom)
    super('Unknown', age, true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
