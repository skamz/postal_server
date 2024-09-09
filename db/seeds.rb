# frozen_string_literal: true
# Seeds go here...
User.create!(
  email_address: 'example@example.com',
  first_name: 'Имя',
  last_name: 'Фамилия',
  password: 'securepassword',
  password_confirmation: 'securepassword',
  time_zone: 'UTC',
  admin: true, # или true, если пользователь должен быть администратором
  uuid: SecureRandom.uuid # генерируем UUID
)

