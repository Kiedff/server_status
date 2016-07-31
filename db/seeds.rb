# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.delete_all
User.delete_all
Event.delete_all
Comment.delete_all

admin1 = User.create!(email: "admin@email.example", password: "password", role: "admin", name: "Admin")
admin2 = User.create!(email: "admin2@email.example", password: "password", role: "admin", name: "Admin2")
User.create!(email: "user@email.example", password: "password", role: "user", name: "User")

critical = Status.create!(name: "Critical", colour: "#ff0000", resolved: false)
minor = Status.create!(name: "Minor Issue", colour: "#FFC200", resolved: false)
ok = Status.create!(name: "All OK", colour: "#24A243", resolved: true)

current = Event.create!(creator: admin1, title: "SAN Issue for VMs connected to XenGarden1 Nodes", content: "We are currently investigating an issue with one of our SANs connected to our XenGarden1 cluster, which may be affecting multiple customers. An update will be posted when more information is available.", active_at: Time.now, status: critical)
prev1 = Event.create!(creator: admin1, title: "vcenter inaccessible", content: "A problem with Melbourne's vmware vcenter has been identified requiring a reboot and update of services. Whilst no VMs are effected, access to the Vcenter interface will be unavailable during this time. Please open a support ticket or call us on 0161 232 0125 for assistance should you require anything to be done during this period of time.", active_at: 2.days.ago, status: ok, resolved_at: 1.days.ago)
Comment.create!(creator: admin1, body: "vcenter is now available again. We are seeing slowness while the final parts of the update complete, normal service should resume shortly.", event: prev1, created_at: 1.days.ago)
prev2 = Event.create!(creator: admin1, title: "vNAS server access", content: "We are currently investigating an issue which may be affecting access to a number of customer's vNAS devices. Whilst we currently believe the service is online we may need to carry out a reboot in order to regain full accessibility.", active_at: 4.days.ago, status: ok, resolved_at: 3.days.ago)
Comment.create!(creator: admin1, body: "vNAS device has been rebooted and services are back online.", event: prev2, created_at: 3.days.ago)
prev3 = Event.create!(creator: admin1, title: "Possible SAN Issue - TUR3-SAS1
", content: "We are currently investigating an issue with one of our SAN units which may be affecting multiple customers. An update will be posted when more information is available.", active_at: 7.days.ago, resolved_at: 5.days.ago, status: ok )
Comment.create!(creator: admin1, body: "We are continuing to work with vendors and affected clients in order to bring the environment back to full resiliance.", event: prev3, created_at: 6.days.ago)
Comment.create!(creator: admin1, body: "All data has been successfully migrated to new SAN infrastructure with services no longer being considered at risk.", created_at: 5.days.ago, event: prev3)
prev4 = Event.create!(creator: admin1, title: "Possible SAN Issue - TUR3-SAS1
", content: "We are currently investigating an issue with one of our SAN units which may be affecting multiple customers. An update will be posted when more information is available.", active_at: 9.days.ago, resolved_at: 7.days.ago, status: ok )
Comment.create!(creator: admin1, body: "We are continuing to work with vendors and affected clients in order to bring the environment back to full resiliance.", event: prev4, created_at: 8.days.ago)
Comment.create!(creator: admin1, body: "All data has been successfully migrated to new SAN infrastructure with services no longer being considered at risk.", created_at: 7.days.ago, event: prev4)
prev5 = Event.create!(creator: admin1, title: "Possible SAN Issue - TUR3-SAS1
", content: "We are currently investigating an issue with one of our SAN units which may be affecting multiple customers. An update will be posted when more information is available.", active_at: 10.days.ago, resolved_at: 8.days.ago, status: ok )
Comment.create!(creator: admin1, body: "We are continuing to work with vendors and affected clients in order to bring the environment back to full resiliance.", event: prev5, created_at: 9.days.ago)
Comment.create!(creator: admin1, body: "All data has been successfully migrated to new SAN infrastructure with services no longer being considered at risk.", created_at: 8.days.ago, event: prev5)
prev6 = Event.create!(creator: admin1, title: "Possible SAN Issue - TUR3-SAS1
", content: "We are currently investigating an issue with one of our SAN units which may be affecting multiple customers. An update will be posted when more information is available.", active_at: 11.days.ago, resolved_at: 9.days.ago, status: ok )
Comment.create!(creator: admin1, body: "We are continuing to work with vendors and affected clients in order to bring the environment back to full resiliance.", event: prev6, created_at: 10.days.ago)
Comment.create!(creator: admin1, body: "All data has been successfully migrated to new SAN infrastructure with services no longer being considered at risk.", created_at: 9.days.ago, event: prev6)
