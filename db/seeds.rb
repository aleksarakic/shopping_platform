# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

buyers = Buyer.create([{name: 'BuyerA', type: 'Buyer', description: 'desc', address: 'AddressA'},
											 {name: 'BuyerB', type: 'Buyer', description: 'desc', address: 'AddressB'}])

suppliers = Supplier.create([{name: 'SupplierA', type: 'Supplier', description: 'desc', address: 'AddressA'},
														 {name: 'SupplierB', type: 'Supplier', description: 'desc', address: 'AddressA'}])

users = User.create([	
										{accountable: Buyer.first ,email: 'a@a.com', password: 'rosepetal', first_name: 'Aleksa', last_name: 'Rakic'},
										{accountable: Buyer.first ,email: 'b@b.com', password: 'rosepetal', first_name: 'John', last_name: 'Doe'},
										{accountable: Supplier.first ,email: 'c@c.com', password: 'rosepetal', first_name: 'Jane', last_name: 'Do'},
										{accountable: Supplier.first ,email: 'd@d.com', password: 'rosepetal', first_name: 'David', last_name: 'Johnson'}
										])

products = Product.create([
													{name: 'Health & Fitness', description: 'desc', price: '1', quantity: '12', category: 'A', supplier_id: 1},
													{name: 'Business', description: 'desc', price: '2', quantity: '13', category: 'B', supplier_id: 1},
													{name: 'Music', description: 'desc', price: '3', quantity: '14', category: 'C', supplier_id: 1},
													{name: 'Sport', description: 'desc', price: '1', quantity: '12', category: 'A', supplier_id: 2},
													{name: 'Religion', description: 'desc', price: '2', quantity: '13', category: 'B', supplier_id: 2},
													{name: 'Lifestyle', description: 'desc', price: '3', quantity: '14', category: 'C', supplier_id: 2}
													])