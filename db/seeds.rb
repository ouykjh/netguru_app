puts "Seeds: start"
User.create!(email: 'admin@admin.com',password: 'adminadmin')

students_list = [
    ['Jan', 'Kowalski', '1992-10-12'],
    ['Adam', 'Nowak', '1991-6-12'],
    ['Michal', 'Ruby', '1989-1-1'],
    ['Jerzy', 'Michalski', '1991-6-12'],
    ['Albert', 'Einstein', '1962-4-22'],
    ['Filip', 'Karnowski', '1991-6-12'],
    ['Geralt', 'Rivii', '1995-6-23'],
    ['Maja', 'Wloszczowska', '1981-8-12'],
    ['Patrycja', 'Karp', '1993-5-11'],
    ['Ksawery', 'Stotrzycztery', '1997-1-5'],
    ['Jack', 'White', '1990-3-24'],
    ['Jolanda', 'Neff', '1988-4-23'],
    ['Jozin', 'Zbazin', '1999-8-23'],
    ['Drow', 'Ranger', '1981-2-2'],
    ['Papa', 'Smerf', '1982-5-5'],
    ['Stephen', 'Curry', '1991-3-1'],
    ['Peter', 'Gabriel', '1984-8-22'],
    ['Gandalf', 'Szary', '1971-9-12'],
    ['Brad', 'Pitt', '1982-9-15'],
    ['Salma', 'Hayek', '1981-3-22'],
    ['Allan', 'Parson', '1992-10-12'],
    ['Tide', 'Hunter', '2000-4-31'],
    ['Robert', 'Lewandowski', '1987-7-31'],
    ['Ray', 'Allen', '1991-4-11'],
    ['Robin', 'Hood', '1982-4-15'],
    ['Anna', 'Szafraniec', '1981-3-8'],
    ['Aleksandra', 'Dawidowicz', '1993-11-11'],
    ['Kazimierz', 'Staszewski', '1992-2-2'],
    ['James', 'Blake', '1982-11-24'],
    ['Kuba', 'Buba', '1995-3-23']
]

teachers_list = [
    ['Wiktor', 'Schmi', 'Prof.'],
    ['Kuba', 'Filipov', 'Prof.'],
    ['Maria', 'Pruch', 'Dr.']
]

subjects_list = [
  'kolarstwo gorskie',
  'informatyka',
  'bieg w workach',
  'latanie na miotle',
  'spiew z karpiem'
]

paid_date_list = [
    '2015-7-7',
    '2015-8-8',
    '2015-1-4',
    '2014-7-3',
    '2010-3-21'
]

students_list.each do |first_name, last_name, birthdate|
  Student.create( first_name: first_name, last_name: last_name,  birthdate: birthdate)
end

teachers_list.each do |first_name, last_name, academic_title|
  Teacher.create( first_name: first_name, last_name: last_name,  academic_title: academic_title)
end

subjects_list.each do |title|
  SubjectItem.create( title: title)
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..5))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

20.times do
  Payment.create(amount: rand() * 1000,
               paid_date: paid_date_list.sample,
               student: students.sample)
end
puts "Seeds: done"
