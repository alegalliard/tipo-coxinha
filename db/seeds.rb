# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

salgados = Category.create(name: 'Salgados')
bolos = Category.create(name: 'Bolos')
doces = Category.create(name: 'Doces')

congelado = DeliveryType.create(name: 'Congelado')
pronto = DeliveryType.create(name: 'Pronto para Consumo')

quilo = Unity.create(name: 'Quilo')
cento = Unity.create(name: 'Cento')

user_salgados = User.create(name: 'Salgados caseiros',
                            email: 'salgados@caseiros.com',
                            password: '12345678',
                            neighborhood: 'Sacomã',
                            city_state: 'São Paulo - SP',
                            phone: '1191234-5678',
                            account_type: 0,
                            avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')),
                            description: 'Os melhores salgados feitos pela Tia Cleuza')

user_loro = User.create(name: 'Loro José Salgados', email: 'loro@jose.com',
                        password: '12345678',
                        neighborhood: 'Sacomã',
                        city_state: 'São Paulo - SP',
                        phone: '1191234-5678',
                        account_type: 0,
                        avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')),
                        description: 'Os melhores salgados feitos pela Tia Cleuza')

user_lu = User.create(name: 'Bolos da Lu', email: 'bolos@lu.com',
                      password: '12345678',
                      neighborhood: 'Sacomã',
                      city_state: 'São Paulo - SP',
                      phone: '1191234-5678',
                      account_type: 0,
                      avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')),
                      description: 'Os melhores salgados feitos pela Tia Cleuza')


user_dora = User.create(name: 'Bolos da Dora', email: 'bolos@dora.com',
                        password: '12345678',
                        neighborhood: 'Sacomã',
                        city_state: 'São Paulo - SP',
                        phone: '1191234-5678',
                        account_type: 0,
                        avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')),
                        description: 'Os melhores salgados feitos pela Tia Cleuza')

user_empadas = User.create(name: 'Empadinhas felizes',
                           email: 'empadas@felizes.com',
                           password: '12345678',
                           neighborhood: 'Sacomã',
                           city_state: 'São Paulo - SP',
                           phone: '1191234-5678',
                           account_type: 0,
                           avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')),
                           description: 'Os melhores salgados feitos pela Tia Cleuza')

user_ana = User.create(name: 'Ana Maria Braga',
                       email: 'ana@maria.com',
                       password: '12345678',
                       neighborhood: 'Sacomã',
                       city_state: 'São Paulo - SP',
                       phone: '1191234-5678',
                       account_type: 1,
                       avatar: File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg')))


Product.create(name: 'Coxinha de frango',
               user: user_loro,
               category: salgados,
               delivery_type: congelado,
               unity: cento,
               price: '100.00')

Product.create(name: 'Coxinha de alcachofra',
               user: user_loro,
               category: salgados,
               delivery_type: congelado,
               unity: cento,
               price: '150.00')

Product.create(name: 'Risole de presunto e queijo',
               user: user_loro,
               category: salgados,
               delivery_type: congelado,
               unity: cento,
               price: '100.00')
