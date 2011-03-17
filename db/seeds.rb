# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject {|c| c.name =~ /^system/}.each(&:drop)

puts 'SETTING UP DEFAULT USER LOGIN'

user = User.create! :name => 'John Galt',
                    :email => 'cinnamon@cdl.net',
                    :password => 'cinnamon',
                    :password_confirmation => 'cinnamon'

puts 'New user created: ' << user.name

puts "CREATING DATA"

disc1 = Discipline.create! :name => 'Software Engineering',
                           :topics => []
                           
puts "Created new discipline: " << disc1.name
                           
topic1 = disc1.topics.create! :description => "Formal Methods",
                            :keywords => ['key1','key2','key3'],
                            :posts => []
                            
puts "Created new topic " << topic1.description
                            
post1 = topic1.posts.create! :title => 'Algebraic Specifications and verifications',
                           :article => 'say something about the content of the article',
                           :creator => 'Pierre Libaski',
                           :date_created => Time.local(2010, 10, 23),
                           :citations => [],
                           :comments => []

puts "Created new post " << post1.title

cite1 = post1.citations.create! :resource_title => 'A Taxonomy of Process Calculi for Distribution and Mobility', 
                               :resource_type => 'Conference', 
                               :date_of_publication => Time.local(2010, 7, 15), 
                               :authors => []

puts "Created new reference " << cite1.resource_title

author1 = ref1.authors.create! :first_name => 'Daniele', 
                               :last_name => 'Gorla', 
                               :email => 'Daniele.Gorla@uniroma.it'

puts "Created new author " << author1.first_name << " " << author1.last_name

# ref2 = post1.citations.create! :resource_title => 'Social Networks and Multi-agent Organizational Performance',
#                                :resource_type => 'Conference',
#                                :date_of_publication => Time.local(2009, 11, 12),
#                                :atuhors => []
# 
# puts "Created new reference " << ref2.resource_title
# 
# author2 = ref2.authors.create! :first_name => 'Mattew', :last_name => 'Gaston', :email => 'mgastol@cs.umbc.edu'
# 
# puts "Created new author " << author2.first_name << " " << author2.last_name
# 
# author3 = ref2.authors.create! :first_name => 'Marie', :last_name => 'desJardins', :email => 'mariedjl@cs.umbc.edu'
# 
# puts "Created new author " << author3.first_name << " " << author3.last_name


comment1 = post1.comments.create! :comment => 'How can we compare the verification tools in this article to others', 
                                  :commentator => 'Luis Angelo', 
                                  :date_created => Time.local(2010, 10, 25)
                                  
puts "Created new comment " << comment1.commentator

comment2 = post1.comments.create! :comment => 'Would like to see a comparison to behavioral appraaches',
                                  :commentator => 'Viktor Onopko',
                                  :date_created => Time.local(2010, 10, 27)
                                  
puts "Created new comment " << comment2.commentator

post2 = topic1.posts.create! :title => 'Specifying and Verifying Mobile Applications with Pi-Calculus',
                             :article => 'Write the content of the article',
                             :creator => 'Andrew Sean',
                             :date_created => Time.local(2010, 11, 02),
                             :citations => [],
                             :comments => []

puts "Created new post " << post2.title
                                                      

topic2 = disc1.topics.create! :description => "Agile methodologies",
                              :keywords => ['key4','key5','key6'],
                              :posts => []

puts "Created new topic " << topic2.description



disc2 = Discipline.create! :name => 'Artificial Intelligence',
                           :topics => []
                                                      
puts "Created new discipline: " << disc2.name

disc3 = Discipline.create! :name => 'Networking',
                           :topics => []
                                                      
puts "Created new discipline: " << disc3.name

disc4 = Discipline.create! :name => 'Information Technology',
                           :topics => []
                                                      
puts "Created new discipline: " << disc4.name


puts "ADDING IDS"