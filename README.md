# README


Technical task:

Library
* Book: title, author
* Order: book, reader, date
* Reader: name, email, city, street, house
* Author: name, biography
* Library: books, orders, readers, authors

Write program that determines:
* Who often takes the book
* What is the most popular book
* How many people ordered one of the three most popular books
* Save all Library data to file(s)
* Get all Library data from file(s)


Task result:

Used in the development:<br>
* ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]
* RubyMine: Ruby on Rails IDE by JetBrains 2018.1 free 30-DAY TRIAL
* pry for debug
* RubyGarage lessons slide

Run:
<br>/library$ ruby test.rb # creation of .json files will happen automatically if permissions on the directory ./storage/json/ are allowed and read the tasks info from the Analytics class.
<br> Data is expected from the user (~.js - ajax) in the format .json or at Ruby language (demo in the test.rb - #Test data)