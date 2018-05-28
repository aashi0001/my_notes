Note.delete_all
User.delete_all
admin = User.create( email: 'admin@example.com', password: '12345678')
Note.create( title: "Pizza", etags: ["yummy"], content: "Pizza is yummy!", status: 1, user: admin )