require 'factory_girl'

Factory.define :user do |u|
  u.name 'Cinnamon'
  u.email 'cinnamon@cdl.net'
  u.password 'cinnamon'
end