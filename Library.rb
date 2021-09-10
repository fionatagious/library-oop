require "ap"

class Library < Array
    def initialize(name)
        @name = name
        puts "Library created with name: " + name
    end

    def add(book)
        self << book 
        puts "Added book, " + book.title + ", to " + @name
    end

    # help
    def remove(isbn)
        puts "Remove book with ISBN? " + isbn
        # each_with_index enables book lookup
        self.each_with_index do |book, i|
            puts "Book.isbn: " + book.isbn
            puts "index: " + i.to_s
            if isbn == book.isbn
                # remove record when found
                self.delete_at(i)
                puts "Found & removed book with ISBN " + book.isbn + " from " + @name
            else
                puts "No match"
            end
        end
    end

    # help
    def catalog
        puts "library.catalog"
        ap self.inspect
    end

    # Print library in human-readable format
    def print_catalog
        puts @name + " Catalog"
        puts Time.now.to_s

        # print all books as a table
        format = '%-15s %-15s %-30s %-20s %s'
        puts format % ['Book Number', 'ISBN', 'Title', 'Author', 'Available']
        self.each_with_index do |book, i|
          puts format % [ i+1, book.isbn, book.title, book.author, book.available ]
        end
    end

    # def checkin(isbn)
    #     # search books for isbn, if find it, return true
    #     # if don't find it: "Error: cannot find book with ISBN 'xyz'
    # end

    def checkout(isbn)
        puts "ISBN passed in: " + isbn
        puts isbn.to_arr 
        puts "book.isbn is: " + book.isbn
        self.each do |book|
            puts book.isbn.to_arr 
            puts book.isbn
                        # until book.isbn.include?(isbn) == true

            # end
            # if book.isbn.include?(isbn) != true # no match between passed in ISBN and valid ISBNs in Library
            #     puts "INVALIDError: cannot find book with ISBN '" + book.isbn + "'"
            # else
            #     puts "VALID ISBN" 
            # end

            # until member.isbn.include?(isbn) == true:
            #     puts "member.isbn is: " + member.isbn
            # if member.isbn.include?(isbn) != true # invalid ISBN
            #     puts "Error: cannot find book with ISBN '" + member.isbn + "'"
            # else # valid ISBN
            #     puts member.isbn + "is a valid ISBN"
            # end

            # if (member.isbn).include?(isbn) == true

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
library = Library.new("Fiona's Library")

# create Book instances with attributes: title, author, isbn
book1 = Book.new('The Sound and The Fury', 'William Faulkner', '9390492572', 'Yes')
book2 = Book.new('Manufacturing Consent', 'Noam Chomsky', '0375714499', 'Yes')

# add book1 and book2 to the library
library.add(book1)
library.add(book2)
library.print_catalog

# remove book2 from the library
library.remove('0375714499')
library.print_catalog

# call library.catalog
library.catalog

# # checkout
# # library.checkout('9390492572') # => "Checked out: 9390492572  The Sound And The Fury  William Faulkner"
# # library.checkout('9390492572') # => "Book with ISBN 9390492572 is already checked out. Sorry!"
# library.checkout('xyz')
