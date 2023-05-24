import 'dart:io';

class Book {
  String title;
  String author;
  String publisher;
  String publicationDate;
  String isbn;

  Book(
      {required this.title,
      required this.author,
      required this.publisher,
      required this.publicationDate,
      required this.isbn});
}

class Member {
  String name;
  String address;
  String phoneNumber;

  Member({required this.name, required this.address, required this.phoneNumber});
}

class Library {
  List<Book> books = [];
  List<Member> members = [];
  List<Map<String, dynamic>> transactions = [];

  void addBook(Book book) {
    books.add(book);
    print('Book added successfully!');
  }

  void removeBook(String title) {
    bool found = false;
    for (var i = 0; i < books.length; i++) {
      if (books[i].title == title) {
        books.removeAt(i);
        found = true;
        break;
      }
    }
    if (found) {
      print('Book removed successfully!');
    } else {
      print('Book not found!');
    }
  }

  void searchBook(String query) {
    List<Book> results = [];
    for (var book in books) {
      if (book.title.contains(query) ||
          book.author.contains(query) ||
          book.publisher.contains(query) ||
          book.isbn.contains(query)) {
        results.add(book);
      }
    }

    if (results.isNotEmpty) {
      print('Search Results:');
      for (var book in results) {
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Publisher: ${book.publisher}');
        print('Publication Date: ${book.publicationDate}');
        print('ISBN: ${book.isbn}');
        print('------------');
      }
    } else {
      print('No results found!');
    }
  }

  void addMember(Member member) {
    members.add(member);
    print('Member added successfully!');
  }

  void removeMember(String name) {
    bool found = false;
    for (var i = 0; i < members.length; i++) {
      if (members[i].name == name) {
        members.removeAt(i);
        found = true;
        break;
      }
    }
    if (found) {
      print('Member removed successfully!');
    } else {
      print('Member not found!');
    }
  }

  void searchMember(String query) {
    List<Member> results = [];
    for (var member in members) {
      if (member.name.contains(query) || member.phoneNumber.contains(query)) {
        results.add(member);
      }
    }

    if (results.isNotEmpty) {
      print('Search Results:');
      for (var member in results) {
        print('Name: ${member.name}');
        print('Address: ${member.address}');
        print('Phone Number: ${member.phoneNumber}');
        print('------------');
      }
    } else {
      print('No results found!');
    }
  }

  void borrowBook(String bookTitle, String memberName) {
    bool bookFound = false;
    bool memberFound = false;

    for (var book in books) {
      if (book.title == bookTitle) {
        bookFound = true;
        break;
      }
    }

    for (var member in members) {
      if (member.name == memberName) {
        memberFound = true;
        break;
      }
    }

    if (bookFound && memberFound) {
      var transaction = {
        'bookTitle': bookTitle,
        'memberName': memberName,
        'borrowDate': DateTime.now()
      };
      transactions.add(transaction);
      print('Book borrowed successfully!');
    } else {
      print('Book or member not found!');
    }
  }

  void returnBook(String bookTitle, String memberName) {
    bool found = false;
    for (var i = 0; i < transactions.length; i++) {
      var transaction = transactions[i];
      if (transaction['bookTitle'] == bookTitle &&
          transaction['memberName'] == memberName) {
        transaction['returnDate'] = DateTime.now();
        found = true;
        break;
      }
    }
    if (found) {
      print('Book returned successfully!');
    } else {
      print('Transaction not found!');
    }
  }
}

void main() {
  var library = Library();

  while (true) {
    print('========== Library Management System ==========');
    print('1. Add Book');
    print('2. Remove Book');
    print('3. Search Book');
    print('4. Add Member');
    print('5. Remove Member');
    print('6. Search Member');
    print('7. Borrow Book');
    print('8. Return Book');
    print('0. Exit');
    print('===============================================');

    stdout.write('Enter your choice: ');
    var choice = stdin.readLineSync();
    if (choice == null) {
      break;
    }

    switch (int.tryParse(choice) ?? -1) {
      case 1:
        stdout.write('Enter Book Title: ');
        var title = stdin.readLineSync() ?? '';
        stdout.write('Enter Author: ');
        var author = stdin.readLineSync() ?? '';
        stdout.write('Enter Publisher: ');
        var publisher = stdin.readLineSync() ?? '';
        stdout.write('Enter Publication Date: ');
        var publicationDate = stdin.readLineSync() ?? '';
        stdout.write('Enter ISBN: ');
        var isbn = stdin.readLineSync() ?? '';

        var book = Book(
          title: title,
          author: author,
          publisher: publisher,
          publicationDate: publicationDate,
          isbn: isbn,
        );

        library.addBook(book);
        break;
      case 2:
        stdout.write('Enter Book Title: ');
        var title = stdin.readLineSync() ?? '';

        library.removeBook(title);
        break;
      case 3:
        stdout.write('Enter Search Query: ');
        var query = stdin.readLineSync() ?? '';

        library.searchBook(query);
        break;
      case 4:
        stdout.write('Enter Member Name: ');
        var name = stdin.readLineSync() ?? '';
        stdout.write('Enter Address: ');
        var address = stdin.readLineSync() ?? '';
        stdout.write('Enter Phone Number: ');
        var phoneNumber = stdin.readLineSync() ?? '';

        var member = Member(name: name, address: address, phoneNumber: phoneNumber);

        library.addMember(member);
        break;
      case 5:
        stdout.write('Enter Member Name: ');
        var name = stdin.readLineSync() ?? '';

        library.removeMember(name);
        break;
      case 6:
        stdout.write('Enter Search Query: ');
        var query = stdin.readLineSync() ?? '';

        library.searchMember(query);
        break;
      case 7:
        stdout.write('Enter Book Title: ');
        var bookTitle = stdin.readLineSync() ?? '';
        stdout.write('Enter Member Name: ');
        var memberName = stdin.readLineSync() ?? '';

        library.borrowBook(bookTitle, memberName);
        break;
      case 8:
        stdout.write('Enter Book Title: ');
        var bookTitle = stdin.readLineSync() ?? '';
        stdout.write('Enter Member Name: ');
        var memberName = stdin.readLineSync() ?? '';

        library.returnBook(bookTitle, memberName);
        break;
      case 0:
        return;
      default:
        print('Invalid choice. Please try again.');
    }

    print('\n');
  }
}
