from main import db,User,Item,Kit,Climate,Culture
db.drop_all()
db.create_all()

new = User('Stan','Ward')
db.session.add(new)
new = User('Fred','Flintstone')
db.session.add(new)
db.session.commit()

new = Item('shirt','Stan')
db.session.add(new)
new = Item('pants','Fred')
db.session.add(new)
new = Item('belt','Fred')
db.session.add(new)
db.session.commit()

new = Kit(1,'Fred')
db.session.add(new)
db.session.commit()

new = Climate('subarctic')
db.session.add(new)
new = Climate('arctic')
db.session.add(new)
db.session.commit()

new = Culture('viking')
db.session.add(new)
new = Culture('pict')
db.session.add(new)
db.session.commit()
