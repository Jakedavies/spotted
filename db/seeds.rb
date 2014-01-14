#
#The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#:
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

items = [{:tag => 'ubco', :user => 'Jacob Davies', :post => 'Some girl accidentally opened the door to my room. While my lights were off. While I was chilling on my computer. In my boxers. They left so quick I cant tell if they thought what they probably thought I was doing, all I got to hear was the most terrified "OH WRONG ROOM SORRY!'},
             {:tag => 'sfu', :user => 'Nolan Koriath', :post => 'When selling a textbook to another student, I think we should start doing it like limousine drivers. Stand at the front doors of where you are going to meet and hold the book up like a limo driver at the air port holding up sign with the passengers name on it.'},
             {:tag => 'oc', :user => 'Megan Jeffries', :post => 'I ran out of deodorant a few days ago before all my finals. Im too busy cramming to go out and buy some more, so I just spray perfume under my arms.
The struggle is real.'},
               {:tag => 'ubco', :user => 'Reid Baldigara', :post => 'Learning about torque in physics, yet all I hear is twerk twerk twerk.'},
               {:tag => 'ubc', :user => 'Spencer Gregoire', :post => 'Harry Potter and Draco Malfoy were killing it pretty hard at Flashbacks last night... although i didnt appreciate being called a dirty mudblood'},
               {:tag => 'tfu', :user => 'Dario Gini', :post => 'I got 99 problems... and money could solve about 73 of them'},
               {:tag => 'tru', :user => 'Jacob Davies', :post => 'Whether or not it was Christmas gifts, holiday break ups, or just the first day of classes, there was a noticeable abundance of hunnies around campus today. Good job ladies.'},
               {:tag => 'sfu', :user => 'Kevin Eger', :post => 'I dont need to have sex because university fucks me on a weekly basis.'},
               {:tag => 'ubco', :user => 'Chris Beda', :post => 'I cried tears of happiness when I saw my most recent midterm mark... it was above 50%. What has my life come to.'},
               {:tag => 'ubco', :user => 'John Carmack', :post => '21-Jun-2000'},
           ]

items.each do |item|
  Item.create!(item)
end
