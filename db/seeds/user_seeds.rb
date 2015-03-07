user = User.create({
  avatar:         File.open(Rails.root.join("app", "assets", "images", "seeds", "matthew.jpg")),
  name:           "Matthew Sullivan",
  email:          "matthew@codelation.com",
  password:       "password123",
  is_approved:    true
})

user2 = User.create({
  avatar:         File.open(Rails.root.join("app", "assets", "images", "seeds", "josh.jpg")),
  name:           "Josh Christy",
  email:          "josh@codelation.com",
  password:       "password123",
  is_approved:    true
})

user3 = User.create({
  avatar:         File.open(Rails.root.join("app", "assets", "images", "seeds", "brian.jpg")),
  name:           "Brian Pattison",
  email:          "brian@codelation.com",
  password:       "password123",
  is_approved:    true
})
