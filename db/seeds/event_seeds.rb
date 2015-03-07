event = Event.create({
  name:                 "NSFargo",
  description:          "Developer focused meet-up group organized by Bill Burgess and Brian Pattison for iOS and OSX development.",
  description_html:     "The next NSFargo meet-up will take place at CoCoFargo. The topic will be <strong>iOS App Extensions and Widgets</strong>.",
  address1:             "122 Broadway N",
  city:                 "Fargo",
  state:                "ND",
  zipcode:              "58102",
  starts_at:            Time.now + 1.day,
  ends_at:              Time.now + 1.day + 2.hours,
  location_description: "CoCo coworking and collaborative space",
  is_approved:          true,
  logo:                 File.open(Rails.root.join("app", "assets", "images", "seeds", "nsfargo.jpg"))
})

event = Event.create({
  name:                 "Interface Fargo",
  description:          "Brilliant people talking about unique solutions to hard tech problems.",
  description_html:     "Brilliant people talking about unique solutions to hard tech problems.",
  address1:             "122 Broadway N",
  city:                 "Fargo",
  state:                "ND",
  zipcode:              "58102",
  starts_at:            Time.now + 1.day,
  ends_at:              Time.now + 1.day + 2.hours,
  location_description: "CoCo coworking and collaborative space",
  is_approved:          true,
  logo:                 File.open(Rails.root.join("app", "assets", "images", "seeds", "interfacefargo.jpg")),
  youtube_video_id:     "blJTX3RtmFk"
})
