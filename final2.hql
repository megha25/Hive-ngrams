create table books(line string) PARTITIONED BY(book_name string);

load data local inpath 'Downloads/A mid summer night dream.txt' into table books PARTITION(book_name='A mid summer night dream');
load data local inpath 'Downloads/Hamlet.txt' into table books PARTITION(book_name='Hamlet');
load data local inpath 'Downloads/Romeo and Juliet.txt' into table books PARTITION(book_name='Romeo and Juliet');
load data local inpath 'Downloads/MacBeth.txt' into table books PARTITION(book_name='MacBeth');
load data local inpath 'Downloads/The tragedy of Julius Casear.txt' into table books PARTITION(book_name='The tragedy of Julius Casear');
load data local inpath 'Downloads/King Richard III.txt' into table books PARTITION(book_name='King Richard III');
load data local inpath 'Downloads/The Merchant of Venice.txt' into table books PARTITION(book_name='The Merchant of Venice');
load data local inpath 'Downloads/The tragedy of King Lear.txt' into table books PARTITION(book_name='The tragedy of King Lear');
load data local inpath 'Downloads/Othello.txt' into table books PARTITION(book_name='Othello');
load data local inpath 'Downloads/The tempest.txt' into table books PARTITION(book_name='The tempest');

create external table output_ngrams (result string);
insert overwrite table output_ngrams
select explode(ngrams(sentences(lower(line)),3,10)) AS trigrams from books;



 

