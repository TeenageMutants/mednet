# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.destroy_all
Branch.destroy_all
User.destroy_all
TypeOrganization.destroy_all
Userinfo.destroy_all
Department.destroy_all
Position.destroy_all
Role.destroy_all

puts "create types organizations"
i = -1
name_type = "Областные учреждения здравоохранения", "Административные учреждения здравоохранения", "Стоматологические поликлиники","Учреждения скорой медициской помощи и переливания крови","Поликлиники","Учреждения охраны материнства и детства","Санаторно-курорнтые учреждения","Медицинские организации особого типа","Образовательные учреждения","Городские учрежения здравоохранения","Учрежения федерального подчинения","Районные учреждения здравоохранения"
loop do
  i+=1
  break if name_type[i].nil?
  TypeOrganization.create(name: name_type[i])
  # puts name_type[i]
end
puts "create MIAC"

miac = Organization.create(short_name: "ГБУЗ КО МИАЦ КО", full_name: "Государственное Учреждение Здравоохранения Калужской области Медицинский Информационно-Аналитический Центр Калужской области", type_organization_id: 2, phone_city_code: 4842, reception_phone: "796710", ext_number: "11", fax: "796710", address: "Калужская область, г.Калуга, ул. Вишневского, д.1", lsd_id: 111, web_site: "http://miac.kaluga.ru")

puts "create positions"

position_one = Position.create(name: "Директор")
position_two = Position.create(name: "Администратор")


puts "create User"

god_admin = User.create(username: "god_admin",password: "XAfb32Mt", email: "seleznev.miac@gmail.com", fio: "Селезнев Михаил Михайлович")
Userinfo.create(user_id: god_admin.id, contact_phone: "725715", ext_number: "32", organization_id: miac.id, position_id: position_two.id)

god_admin.add_role "admin"



admin = User.create(username: "admin", password: "!ELD1Wine!", email: "admin@miac.kaluga.ru", fio: "Админов Админ Админович")
Userinfo.create(user_id: admin.id, contact_phone: "725806", ext_number: "46", organization_id: miac.id, position_id: position_two.id)

admin.add_role "technics"



