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

    # WIP: should return true if found & removed
    def remove(isbn)
        puts "Remove book with ISBN? " + isbn
        # each_with_index enables book lookup
        self.each_with_index do |book, i|
            if isbn == book.isbn
                # remove book at specified index
                self.delete_at(i)
                puts "Found & removed book with ISBN " + book.isbn + " from " + @name
            end
        end
    end

    # WIP: only print object names rather than all contents of objects
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

    def checkin(isbn)
        puts "Checking in book with ISBN " + isbn
        self.each_with_index do |book, i|
            if isbn == book.isbn
                if book.available != "Yes"
                    book.available = "Yes"
                else
                    puts "Book is already checked in/available"
                end
            end
        end
    end

    def checkout(isbn)
        puts "Checking out book with ISBN " + isbn
        self.each_with_index do |book, i|
            if isbn == book.isbn
                if book.available == "No"
                    puts "Book with ISBN " + book.isbn + " is already checked out. Sorry!"
                else
                    book.available = "No"
                    puts "Book with ISBN " + book.isbn + " is now checked out! Happy reading!"
                end    
            end
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

# add book1 again
library.add(book2)
library.print_catalog

# already checked in
library.checkin('9390492572')
library.checkin('0375714499')

# check out available book
library.checkout('9390492572')
library.print_catalog

# already checked out
library.checkout('9390492572')
library.print_catalog

# check in
library.checkin('9390492572')
library.print_catalog

# library.checkout('xyz')
# library.catalog