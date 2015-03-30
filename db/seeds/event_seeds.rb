nsfargo = Organizer.create(
  name: "NSFargo",
  description: "Developer focused meet-up group organized by Bill Burgess and Brian Pattison for iOS and OSX development.",
  logo: File.open(Rails.root.join("app/assets/images/nsfargo.jpg")),
  site_url: "http://nsfargo.com"
)
event = nsfargo.events.create({
  description_html:     "The next NSFargo meet-up will take place at CoCoFargo. The topic will be <strong>iOS App Extensions and Widgets</strong>.",
  address1:             "122 Broadway N",
  city:                 "Fargo",
  state:                "ND",
  zipcode:              "58102",
  starts_at:            Time.now + 1.day,
  ends_at:              Time.now + 1.day + 2.hours,
  location_description: "CoCo coworking and collaborative space"
})


interface = Organizer.create(
  name: "Interface Fargo",
  description: "Brilliant people talking about unique solutions to hard tech problems.",
  logo: File.open(Rails.root.join("app/assets/images/seeds/interfacefargo.jpg"))
)
event = interface.events.create({
  description_html:     "Brilliant people talking about unique solutions to hard tech problems.",
  address1:             "122 Broadway N",
  city:                 "Fargo",
  state:                "ND",
  zipcode:              "58102",
  starts_at:            Time.now + 1.day,
  ends_at:              Time.now + 1.day + 2.hours,
  location_description: "CoCo coworking and collaborative space",
  youtube_video_id:     "blJTX3RtmFk"
})
