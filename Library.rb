require "ap"

class Library < Array
    def initialize(name)
        @name = name
        puts "Library created with name: " + name
    end

    def add(book)
        self << book 
        puts "Added book, " + book.title + ", to library"
    end

    # def remove(isbn_str)
    #     self.delete()
    #     # search Library for isbn, remove record when found
    #     # array
    # end

    # help
    def catalog
        ap self.inspect
        # ap self.to_s
    end

    def print_catalog
        puts "print Library in human-readable format"
        puts @name + " Catalog"
        puts Time.now.to_s

        # print all books as a table
        format = '%-15s %-15s %-30s %-20s %s'
        puts format % ['Book Number', 'ISBN', 'Title', 'Author', 'Available']
        self.each_with_index do |member, i|
          puts format % [ i+1, member.isbn, member.title, member.author, member.available ]
        end
    end

    # def checkin(isbn)
    #     # search books for isbn, if find it, return true
    #     # if don't find it: "Error: cannot find book with ISBN 'xyz'
    # end

    def checkout(isbn)
        # valid isbn
        puts "ISBN entered: " + isbn
        self.each do |member|
            puts member.isbn
            puts member.isbn.include?(isbn)

            # if (member.isbn).include?(isbn) == true
            # else

            # end
            # if member.isbn == isbn # if ISBN match
            #     if member.available = "No"
            #         puts "Book with ISBN " + member.isbn + "is already checked out. Sorry!"
            #     else
            #         member.available = "No" 
            #         puts "Checked out: " + member.isbn + " " + member.title
            #     end
            # else # if no ISBN match
                # puts "Error: cannot find book with ISBN '" + member.isbn + "'"
            # end
        end
    end
end

class Book
    # attributes with read & write permissions
    attr_accessor :title, :author, :isbn, :available

    # called whenever a Book is created with Book.new()
    def initialize(title, author, isbn, available)
        @title = title
        @author = author
        @isbn = isbn
        @available = available
    end
end

# create Library instance with name 'My Library'
library = Library.new('My Library')
# create Book instances with attributes: title, author, isbn
book1 = Book.new('The Sound and The Fury', 'William Faulkner', '9390492572', 'Yes')
book2 = Book.new('Manufacturing Consent', 'Noam Chomsky', '0375714499', 'Yes')
# add book1 and book2 to the library
library.add(book1)
library.add(book2)
# call library.catalog
library.catalog
# print the catalog in a human-readable format
library.print_catalog
# checkout
library.checkout('9390492572') # => "Checked out: 9390492572  The Sound And The Fury  William Faulkner"
# library.checkout('9390492572') # => "Book with ISBN 9390492572 is already checked out. Sorry!"
library.checkout('xyz')
