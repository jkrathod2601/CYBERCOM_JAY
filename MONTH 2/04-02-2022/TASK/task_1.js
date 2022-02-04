// Case 1.

// Write a JavaScript program to display the reading status (i.e. display book name, author name and reading status) of the following books.

var library = [

    {

        author: 'Bill Gates',

        title: 'The Road Ahead',

        readingStatus: true

    },

    {

        author: 'Steve Jobs',

        title: 'Walter Isaacson',

        readingStatus: true

    },

    {

        author: 'Suzanne Collins',

        title: 'Mockingjay: The Final Book of The Hunger Games',

        readingStatus: false

    }
];

let s = ""
for (let i of library) {
    s = s + `the book title is <h3>${i.title}</h3> and author is <h3>${i.author}</h3> and this book is read by me?.. ${i.readingStatus}<br><hr>`
}

document.getElementById("text").innerHTML = s