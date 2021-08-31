# Library

Let's get some OOP practice in Ruby!  Write some OOP Ruby code to model a Library application. This should not be in a Rails application, just POROS (plain old ruby objects).

Stories (with example calling code):
* Instantiate a library
`library = Library.new('My Library')`

* Add a Book to the catalog. Books have a title, author and ISBN (unique id)
```
book = Book.new('The Sound and The Fury', 'William Faulkner', '9390492572')
library.add(book)
```

* List the catalog
```
library.catalog
=> [ Book1, Book2, ... ]
```

* Print the catalog in a human-readable format
```
library.print_catalog
=>
My Library Catalog 
2021-08-28 13:07:09 -0500

ISBN        Title                   Author            Available?
9390492572  The Sound And The Fury  William Faulkner  Yes
0375714499  Manufacturing Consent   Noam Chomsky      No
```

* Remove a book by isbn
```
library.remove('9390492572')
=> true
```

* Borrow and return a book by isbn
```
library.checkout('9390492572')
=> "Checked out: 9390492572  The Sound And The Fury  William Faulkner"


library.checkout('9390492572')
=> "Book with ISBN 9390492572 is already checked out. Sorry!"


library.checkout('xyz')
=> "Error: cannot find book with ISBN 'xyz'"

library.checkin('9390492572')
=> true
```


Additional functionalities, if you feel like it:
* List available & unavailable books
* Reject invalid ISBNs
* Allow multiple copies of a book in the catalog
* Checkout and return multiple books at a time
... etc, use your imagination :)
