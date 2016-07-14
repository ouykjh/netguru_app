class TeacherDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_title
    "#{teacher.decorate.full_name} [#{academic_title}]"
  end
end
