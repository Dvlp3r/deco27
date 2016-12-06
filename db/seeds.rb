# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create email: 'patrick@dvlper.com', password: '1234567890'

# # porc = Category.where(name: "Porcelains").first_or_create

# # porc_subcategories = %w{Floors Living Dining Kitchen Walls Bathroom Patio}

# categories = {}

# categories["Porcelains"] = ["Floors", "Living", "Dining", "Kitchen", "Walls", "Bathroom", "Patio",]

# categories["Walls"] = ["Wood", "Porcelain", "Leather", "Extravaganza",]

# categories["Doors"] = ["Modern", "Transitional", "Eco", "Viva", "Spazioquadro", "Krona Frameless"]
#   categories["Modern"] = ["Wenge", "Matte White", "Gray", "Light Oak", "Mahogany"]
#   categories["Transitional"] = ["Wenge", "Matte White", "Gray", "Light Oak", "Mahogany"]
#   categories["Eco"] = ["Eco Wenge", "Eco White", "Eco Gray", "Eco Light Oak"]
#   categories["Viva"] = ["Rain of Hearts", "Fireworks", "Spring", "Streamers", "Spots", "Star", "Glass", "Two-Faced"]
#   categories["Spazioquadro"] = ["Sensazioni"]
#   categories["Krona Frameless"] = ["Swing Doors", "Sliding Systems"]

# categories["Bathroom"] = ["Catalog", "Water Sensations", "Bathroom Accessories", "Faucet Collection", "Bathtub Collection", "Furniture", "Sinks", "Plumbing Accessories", "Toilet Collection"]
#   categories["Water Sensations"] = ["Square Shower Heads", "Rectangle Shower Heads", "Round Shower Heads", "Shower Controls", "Accessories"]
#   categories["Bathroom Accessories"] = ["Air", "Curve", "Form", "Tube", "Una"]
#   categories["Faucet Collection"] = ["Curve", "Form", "Spin", "Tube", "Una", "Wave"]
#   categories["Bathtub Collection"] = ["ACM", "Acrylic"]
#   categories["Sinks"] = ["Undermount", "ACM", "Ceramic"]
#   categories["Plumbing Accessories"] = ["Drains", "Bottle Trap", "Angle Valves", "Water Outlet", "Pop Ups", "Shower Arms/Sliding Bar", "Hose"]
#   categories["Toilet Collection"] = ["Wall Hung", "One Piece"]

# categories["Hardwood Floors"] = ["The Atelier Collection", "The Chateau Collection", "The Heritage Collection", "The Riverstone Collection",
#                                  "The Strata Collection", "The Terra Collection", "The Vintage Remains Collection", "The New Classics Collection",
#                                  "The Palais Collection", "The Italian Collection"]
#   categories["The Italian Collection"] = ["Contermporary/Modern", "Casual/Country/Tropical", "Eclectic", "Commercial"]                               

# categories["Recycled Leather Floors"] = []
# # Category.find_or_create_by(name: "Doors")




# categories.each do |k, v|
#   parent = Category.where(name: k).first_or_create
#   v.each do |child|
#     parent.children.where(name: child).first_or_create
#   end
# end

# Category.find_or_create_by(name: "Walls")

# Category.find_or_create_by(name: "Hardwood Floors")

# Category.find_or_create_by(name: "Stairs")

categories = {}
categories["Porcelains"] = ["Concrete Look", "Stone Look", "Fabric Look", "Wood Look", "Mosaics"]

categories["Walls"] = ["Finium", "Duchateau"]

categories["Doors"] = ["Collections", "Moderns", "Transitional", "Eco"]

categories["Bathroom"] = ["Bathroom Accessories" => ["Accessories"],
                          "Faucet Collection" => ["Kitchen", "Bathroom"],
                          "Bathtub Collection" => ["ACM", "Acrylic"],
                          "Sinks" => ["Undermount", "ACM", "Ceramic"],
                          "Toilet Collection" => ["Wall Hung", "One Piece"]
                          ]

categories["Hardwood Floors"] = ["Studio 27", "The Planks", "Bois du Chandon"]
categories["Decking"] = []

categories.each do |k, v|
  parent = Category.roots.where(name: k).first_or_create
  v.each do |value|
    if value.is_a? String
      parent.children.where(name: value).first_or_create
    elsif value.is_a? Hash
      value.each do |kk, vv|
        p = parent.children.where(name: kk).first_or_create
        vv.each do |vvv|
          p.children.where(name: vvv).first_or_create
        end
      end
    end
  end
end