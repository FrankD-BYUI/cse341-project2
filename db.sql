-- All book data was pulled from this site and then manually formatted for this use: 
-- https://www.goodreads.com/list/show/24716.Highest_Rated_Books_on_Goodreads_with_at_least_100_ratings_

-- clear existing tables
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
-- Create tables
CREATE TABLE authors (
  author_id SERIAL NOT NULL PRIMARY KEY,
  author_name VARCHAR(100) NOT NULL,
  author_dob DATE,
  author_dod DATE,
  author_birthcountry VARCHAR(255)
);
CREATE TABLE books (
  book_id SERIAL NOT NULL PRIMARY KEY,
  book_title VARCHAR NOT NULL,
  book_pubdate DATE,
  book_description VARCHAR,
  book_rating NUMERIC(3, 2),
  author_id INTEGER REFERENCES authors (author_id)
);
-- Seed Authors
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Arthur Conan Doyle',
    '5/22/1859',
    '7/7/1930',
    'Scotland'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Bill Watterson',
    '7/5/1958',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Brandon Sanderson',
    '12/19/1975',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Brian K. Vaughan',
    '7/17/1976',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES ('Cassandra Clare', '7/27/1973', null, 'Iran');
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Fernando Pessoa',
    '6/13/1888',
    '11/30/1935',
    'Portugal'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Georg Trakl',
    '2/3/1887',
    '11/3/1914',
    'Austria'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'George R.R. Martin',
    '9/20/1948',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES ('Hafez', '1/1/1315', '1/1/1390', 'Iran');
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'J.K. Rowling',
    '7/31/1965',
    null,
    'United Kingdom'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Jane Austen',
    '12/16/1775',
    '7/18/1817',
    'United Kingdom'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Jim Butcher',
    '10/26/1971',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Jorge Luis Borges',
    '8/24/1899',
    '6/14/1986',
    'Argentina'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Kristin Hannah',
    '9/25/1960',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Neil Gaiman',
    '9/10/1960',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Patrick Rothfuss',
    '6/6/1973',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES ('Quino', '7/17/1932', '9/30/2020', 'Argentina');
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Rainer Maria Rilke',
    '12/4/1875',
    '12/29/1926',
    'Czechia'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Richard P. Feynman',
    '5/11/1918',
    '2/15/1988',
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Rick Riordan',
    '6/5/1964',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES ('Rumi', '9/30/1207', '12/17/1273', 'Afghanistan');
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'Sarah J. Maas',
    '3/5/1986',
    null,
    'The United States'
  );
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES ('Wildbow', '1/1/1984', null, 'Canada');
INSERT INTO authors (
    author_name,
    author_dob,
    author_dod,
    author_birthcountry
  )
VALUES (
    'William Shakespeare',
    '4/1/1564',
    '4/23/1616',
    'United Kingdom'
  );
-- Seed Books
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Harry Potter and the Deathly Hallows',
    '7/21/2007',
    'Harry Potter is leaving Privet Drive for the last time. But as he climbs into the sidecar of Hagrids motorbike and they take to the skies, he knows Lord Voldemort and the Death Eaters will not be far behind.',
    '4.62',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'J.K. Rowling'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Name of the Wind',
    '4/1/2007',
    'Told in Kvothes own voice, this is the tale of the magically gifted young man who grows to be the most notorious wizard his world has ever seen.',
    '4.52',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Patrick Rothfuss'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Book of Disquiet',
    '12/31/2002',
    'Fernando Pessoa was many writers in one. He attributed his prolific writings to a wide range of alternate selves, each of which had a distinct biography, ideology. and horoscope. When he died in 1935, Pessoa left behind a trunk filled with unfinished and unpublished writings, among which were the remarkable pages that make up his posthumous masterpiece, The Book of Disquiet, an astonishing work that, in George Steiners words, gives to Lisbon the haunting spell of Joyces Dublin or Kafkas Prague.Published for the first time some fifty years after his death, this unique collection of short, aphoristic paragraphs comprises the autobiography of Bernardo Soares, one of Pessoas alternate selves. Part intimate diary, part prose poetry, part descriptive narrative, captivatingly translated by Richard Zenith, The Book of Disquiet is one of the greatest works of the twentieth century.',
    '4.44',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Fernando Pessoa'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Collected Fictions',
    '9/30/1999',
    'Jorge Luis Borges has been called the greatest Spanish-language writer of our century. Now for the first time in English, all of Borges dazzling fictions are gathered into a single volume, brilliantly translated by Andrew Hurley. From his 1935 debut with The Universal History of Iniquity, through his immensely influential collections Ficciones and The Aleph, these enigmatic, elaborate, imaginative inventions display Borges talent for turning fiction on its head by playing with form and genre and toying with language. Together these incomparable works comprise the perfect one-volume compendium for all those who have long loved Borges, and a superb introduction to the masters work for those who have yet to discover this singular genius.',
    '4.58',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Jorge Luis Borges'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Ahead of All Parting: The Selected Poetry and Prose',
    '8/1/1995',
    'The reputation of Rainer Maria Rilke has grown steadily since his death in 1926; today he is widely considered to be the greatest poet of the twentieth century. This Modern Library edition presents Stephen Mitchells acclaimed translations of Rilke, which have won praise for their re-creation of the poets rich formal music and depth of thought. “If Rilke had written in English,” Denis Donoghue wrote in The New York Times Book Review, “he would have written in this English.” Ahead of All Parting is an abundant selection of Rilkes lifework. It contains representative poems from his early collections The Book of Hours and The Book of Pictures; many selections from the revolutionary New Poems, which drew inspiration from Rodin and Cezanne; the hitherto little-known “Requiem for a Friend”; and a generous selection of the late uncollected poems, which constitute some of his finest work. Included too are passages from Rilkes influential novel, The Notebooks of Malte Laurids Brigge, and nine of his brilliant uncollected prose pieces. Finally, the book presents the poets two greatest masterpieces in their entirety: the Duino Elegies and The Sonnets to Orpheus. “Rilkes voice, with its extraordinary combination of formality, power, speed and lightness, can be heard in Mr. Mitchells versions more clearly than in any others,” said W. S. Merwin. “His work is masterful.',
    '4.62',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Rainer Maria Rilke'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Autumn Sonata: Selected Poems',
    '1/1/1998',
    'Georg Trakls poems are considered some of the most difficult for any translator to tackle; his German is dense and sometimes almost impenetrable. Daniel Simkos collection Autumn Sonata, has been lauded for the simplicity and directness of its translations, accomplished with out sacrificing the drama of Trakls rich imagery.Suffering from manic depressive episodes and haunted by his experiences tending the wounded and dying during World War One, Trakls poems reflect a sense of lostness: nightmare visions and disembodied voices provide an often eccentric perspective of reality. Though he yearns for deliverance, there poems do not anticipate it. Instead, they map the interior landscape of a brilliant, though troubled, spirit.',
    '4.66',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Georg Trakl'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Way of Kings',
    '8/31/2010',
    'Roshar is a world of stone and storms. Uncanny tempests of incredible power sweep across the rocky terrain so frequently that they have shaped ecology and civilization alike. Animals hide in shells, trees pull in branches, and grass retracts into the soilless ground. Cities are built only where the topography offers shelter.
It has been centuries since the fall of the ten consecrated orders known as the Knights Radiant, but their Shardblades and Shardplate remain: mystical swords and suits of armor that transform ordinary men into near-invincible warriors. Men trade kingdoms for Shardblades. Wars were fought for them, and won by them.
One such war rages on a ruined landscape called the Shattered Plains. There, Kaladin, who traded his medical apprenticeship for a spear to protect his little brother, has been reduced to slavery. In a war that makes no sense, where ten armies fight separately against a single foe, he struggles to save his men and to fathom the leaders who consider them expendable.
Brightlord Dalinar Kholin commands one of those other armies. Like his brother, the late king, he is fascinated by an ancient text called The Way of Kings. Troubled by over-powering visions of ancient times and the Knights Radiant, he has begun to doubt his own sanity.
Across the ocean, an untried young woman named Shallan seeks to train under an eminent scholar and notorious heretic, Dalinars niece, Jasnah. Though she genuinely loves learning, Shallans motives are less than pure. As she plans a daring theft, her research for Jasnah hints at secrets of the Knights Radiant and the true cause of the war.
The result of over ten years of planning, writing, and world-building, The Way of Kings is but the opening movement of the Stormlight Archive, a bold masterpiece in the making.',
    '4.61',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Brandon Sanderson'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Words of Radiance',
    '3/4/2014',
    'Expected by his enemies to die the miserable death of a military slave, Kaladin survived to be given command of the royal bodyguards, a controversial first for a low-status darkeyes. Now he must protect the king and Dalinar from every common peril as well as the distinctly uncommon threat of the Assassin, all while secretly struggling to master remarkable new powers that are somehow linked to his honorspren, Syl.
The Assassin, Szeth, is active again, murdering rulers all over the world of Roshar, using his baffling powers to thwart every bodyguard and elude all pursuers. Among his prime targets is Highprince Dalinar, widely considered the power behind the Alethi throne. His leading role in the war would seem reason enough, but the Assassins master has much deeper motives.
Brilliant but troubled Shallan strives along a parallel path. Despite being broken in ways she refuses to acknowledge, she bears a terrible burden: to somehow prevent the return of the legendary Voidbringers and the civilization-ending Desolation that will follow. The secrets she needs can be found at the Shattered Plains, but just arriving there proves more difficult than she could have imagined
Meanwhile, at the heart of the Shattered Plains, the Parshendi are making an epochal decision. Hard pressed by years of Alethi attacks, their numbers ever shrinking, they are convinced by their war leader, Eshonai, to risk everything on a desperate gamble with the very supernatural forces they once fled. The possible consequences for Parshendi and humans alike, indeed, for Roshar itself, are as dangerous as they are incalculable.',
    '4.74',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Brandon Sanderson'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Complete Calvin and Hobbes',
    '9/6/2005',
    'Calvin and Hobbes is unquestionably one of the most popular comic strips of all time. The imaginative world of a boy and his real-only-to-him tiger was first syndicated in 1985 and appeared in more than 2,400 newspapers when Bill Watterson retired on January 1, 1996. The entire body of Calvin and Hobbes cartoons published in a truly noteworthy tribute to this singular cartoon in The Complete Calvin and Hobbes. Composed of three hardcover, four-color volumes in a sturdy slipcase, this New York Times best-selling edition includes all Calvin and Hobbes cartoons that ever appeared in syndication. This is the treasure that all Calvin and Hobbes fans seek.',
    '4.81',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Bill Watterson'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Wise Mans Fear',
    '3/1/2011',
    'My name is Kvothe.
I have stolen princesses back from sleeping barrow kings. I burned down the town of Trebon. I have spent the night with Felurian and left with both my sanity and my life. I was expelled from the University at a younger age than most people are allowed in. I tread paths by moonlight that others fear to speak of during day. I have talked to Gods, loved women, and written songs that make the minstrels weep.
You may have heard of me.
So begins the tale of a hero told from his own point of view — a story unequaled in fantasy literature. Now in The Wise Mans Fear, an escalating rivalry with a powerful member of the nobility forces Kvothe to leave the University and seek his fortune abroad. Adrift, penniless, and alone, he travels to Vintas, where he quickly becomes entangled in the politics of courtly society. While attempting to curry favor with a powerful noble, Kvothe uncovers an assassination attempt, comes into conflict with a rival arcanist, and leads a group of mercenaries into the wild, in an attempt to solve the mystery of who (or what) is waylaying travelers on the Kings Road.
All the while, Kvothe searches for answers, attempting to uncover the truth about the mysterious Amyr, the Chandrian, and the death of his parents. Along the way, Kvothe is put on trial by the legendary Adem mercenaries, is forced to reclaim the honor of the Edema Ruh, and travels into the Fae realm. There he meets Felurian, the faerie woman no man can resist, and who no man has ever survived ... until Kvothe.
In The Wise Mans Fear, Kvothe takes his first steps on the path of the hero and learns how difficult life can be when a man becomes a legend in his own time.',
    '4.54',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Patrick Rothfuss'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'A Storm of Swords',
    '3/4/2003',
    'Here is the third volume in George R.R. Martins magnificent cycle of novels that includes A Game of Thrones and A Clash of Kings. Together, this series comprises a genuine masterpiece of modern fantasy, destined to stand as one of the great achievements of imaginative fiction.
Of the five contenders for power, one is dead, another in disfavor, and still the wars rage as alliances are made and broken. Joffrey sits on the Iron Throne, the uneasy ruler of the Seven Kingdoms. His most bitter rival, Lord Stannis, stands defeated and disgraced, victim of the sorceress who holds him in her thrall. Young Robb still rules the North from the fortress of Riverrun. Meanwhile, making her way across a blood-drenched continent is the exiled queen, Daenerys, mistress of the only three dragons still left in the world. And as opposing forces manoeuver for the final showdown, an army of barbaric wildlings arrives from the outermost limits of civilization, accompanied by a horde of mythical Others—a supernatural army of the living dead whose animated corpses are unstoppable. As the future of the land hangs in the balance, no one will rest until the Seven Kingdoms have exploded in a veritable storm of swords...',
    '4.53',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'George R.R. Martin'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Harry Potter and the Prisoner of Azkaban',
    '5/1/2004',
    'For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black. Convicted of killing thirteen people with a single curse, he was said to be the heir apparent to the Dark Lord, Voldemort.
Now he has escaped, leaving only two clues as to where he might be headed: Harry Potters defeat of You-Know-Who was Blacks downfall as well. And the Azkaban guards heard Black muttering in his sleep, Hes at Hogwarts . . . hes at Hogwarts.
Harry Potter isnt safe, not even within the walls of his magical school, surrounded by his friends. Because on top of it all, there may well be a traitor in their midst.',
    '4.57',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'J.K. Rowling'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Complete Novels of Jane Austen',
    '1/18/1989',
    'Jane Austen wrote in the eighteenth century, but her novels are timeless. This complete anthology is unique among single-volume editions of her workbecause it includes the obscure but delightful Lady Susan, along with the six better-known novels and thirty of Hugh Thomsons irresistible drawings. All of Jane Austens novels are love stories, all are stories of country gentry, and all end happily, one way or another. Her plots have the complexity of life and her characters are described with inimitable style and witwhether caustic or warmly affectionate. The novels contained in this anthology are Pride and Prejudice, Sense and Sensibility, Mansfield Park, Emma, Northanger Abbey, Persuasion, and Lady Susan. The nineteenth-century illustrations of Hugh Thomson capture the flavor of Jane Austens characters and enhance this extraordinary collection of the complete works of one of the greatest novelists of all time.',
    '4.56',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Jane Austen'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Harry Potter and the Goblet of Fire',
    '9/28/2002',
    'Harry Potter is midway through his training as a wizard and his coming of age. Harry wants to get away from the pernicious Dursleys and go to the International Quidditch Cup with Hermione, Ron, and the Weasleys. He wants to dream about Cho Chang, his crush (and maybe do more than dream). He wants to find out about the mysterious event thats supposed to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasnt happened for hundreds of years. He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, hes not normal - even by wizarding standards.
And in his case, different can be deadly.',
    '4.56',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'J.K. Rowling'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Harry Potter and the Half-Blood Prince',
    '9/16/2006',
    'The war against Voldemort is not going well; even Muggle governments are noticing. Ron scans the obituary pages of the Daily Prophet, looking for familiar names. Dumbledore is absent from Hogwarts for long stretches of time, and the Order of the Phoenix has already suffered losses.
And yet . . .
As in all wars, life goes on. The Weasley twins expand their business. Sixth-year students learn to Apparate - and lose a few eyebrows in the process. Teenagers flirt and fight and fall in love. Classes are never straightforward, through Harry receives some extraordinary help from the mysterious Half-Blood Prince.
So its the home front that takes center stage in the multilayered sixth installment of the story of Harry Potter. Here at Hogwarts, Harry will search for the full and complete story of the boy who became Lord Voldemort - and thereby find what may be his only vulnerability.',
    '4.57',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'J.K. Rowling'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Clockwork Princess',
    '9/5/2013',
    'Danger and betrayal, love and loss, secrets and enchantment are woven together in the breathtaking finale to the #1 New York Times bestselling Infernal Devices Trilogy, prequel to the internationally bestselling Mortal Instruments series.
THE INFERNAL DEVICES WILL NEVER STOP COMING
A net of shadows begins to tighten around the Shadowhunters of the London Institute. Mortmain plans to use his Infernal Devices, an army of pitiless automatons, to destroy the Shadowhunters. He needs only one last item to complete his plan: he needs Tessa Gray.
Charlotte Branwell, head of the London Institute, is desperate to find Mortmain before he strikes. But when Mortmain abducts Tessa, the boys who lay equal claim to her heart, Jem and Will, will do anything to save her. For though Tessa and Jem are now engaged, Will is as much in love with her as ever.
As those who love Tessa rally to rescue her from Mortmains clutches, Tessa realizes that the only person who can save her is herself. But can a single girl, even one who can command the power of angels, face down an entire army?
Danger and betrayal, secrets and enchantment, and the tangled threads of love and loss intertwine as the Shadowhunters are pushed to the very brink of destruction in the breathtaking conclusion to the Infernal Devices trilogy.',
    '4.55',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Cassandra Clare'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Poems of Fernando Pessoa',
    '1/1/2001',
    'At last, at last, at last, Pessoa again! More Pessoa! One of the very great poets of the twentieth century, again and more! And one of the fascinating figures of all literature, with his manifold identities, his amazing audacities, his brilliance and his shyness. I think I have under control the reluctance I feel in having to share Pessoa with the public he should have had all along in America: until now, only the poets, so far as I can tell, have even heard of him, and delighted and exulted in him. He is, in some ways, the poet of modernism, the only one willing to fracture himself into the parcels of action, anguish, and nostalgia which are the grounds of our actual situation. —C. K. Williams
Pessoa is one of the great originals (a fact rendered more striking by his writing as several distinct personalities) of the European poetry of the first part of this century, and has been one of the last poets of comparable stature, in the European languages, to become known in English. Edwin Honigs translations of Spanish and Portuguese poetry have been known to anyone who cares about either, since his work on Lorca in the forties, and his Selected Poems of Pessoa (1971) was a welcome step toward a long-awaited larger colection. — W. S. Merwin
Fernando Pessoa is the least known of the masters of the twentieth-century poetry. From his heteronymic passion he produced, if that is the word, two of our greatest poets, Alberto Caeiro and Álvaro de Campos, and a third, Ricardo Reis, who isnt bad. Pessoa is the exemplary poet of the self as other, of the poem as testament to unreality, proclamation of nothingness, occasion for expectancy. In Edwin Honigs and Susan Browns superb translations, Pessoa and his others live with miraculous style and vitality. —Mark Strand
Fernando Pessoa is Portugals most important contemporary poet. He wrote under several identities, which he called heteronyms: Albet Caeiro, Alvaro de Campos, Ricardo Reis, and Bernardo Soares. He wrote sublime poetry under his own name as well, and each of his “voices” is completely different in subject, temperament, and style. This volume brings back into print the comprehensive collection of his work published by Ecco Press in 1986.',
    '4.51',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Fernando Pessoa'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Soul of Rumi: A New Collection of Ecstatic Poems',
    '9/17/2002',
    'Inside A Lovers Heart Theres Another World, And Yet Another Rumis masterpieces have inspired countless people throughout the centuries, and Coleman Barkss exquisite renderings of the thirteenth-century Persian mystic are widely considered the definitive versions for our time. Barkss translations capture the inward exploration and intensity that characterize Rumis poetry, making this unique voice of mysticism and desire contemporary while remaining true to the original poems. In this volume readers will encounter the essence of Sufisms insights into the experience of divine love, wisdom, and the nature of both humanity and God.
While Barkss stamp on this collection is clear, it is Rumis voice that leaps off these pages with a rapturous power that leaves readers breathless. These poems express our deepest yearning for the transcendent connection with the source of the divine: there are passionate outbursts about the torment of longing for the beloved and the sweet delight that comes from union; stories of sexual adventures and of loss; poems of love and fury, sadness and joy; and quiet truths about the beauty and variety of human emotion. For Rumi, soul and body and emotion are not separate but are rather part of the great mystery of mortal life, a riddle whose solution is love. Above all else, Rumis poetry exposes us to the delight that comes from being fully alive, urging us always to put aside our fears and take the risk of discovering our core self:
No one knows what makes the soul wake up so happy! Maybe a dawn breeze has blown the veil from the face of God. These fresh, original translations magnificently convey Rumis insights into the human heart and its longings with his signature passion and daring, focusing on the ecstatic experience of the inseparability of human and divine love. The match between Rumis sublime poetry and Coleman Barkss poetic art are unequaled, and here this artistic union is raised to new heights.',
    '4.49',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Rumi'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'A Court of Mist and Fury',
    '5/3/2016',
    'Feyre survived Amaranthas clutches to return to the Spring Court—but at a steep cost. Though she now has the powers of the High Fae, her heart remains human, and it cant forget the terrible deeds she performed to save Tamlins people.
Nor has Feyre forgotten her bargain with Rhysand, High Lord of the feared Night Court. As Feyre navigates its dark web of politics, passion, and dazzling power, a greater evil looms—and she might be key to stopping it. But only if she can harness her harrowing gifts, heal her fractured soul, and decide how she wishes to shape her future—and the future of a world cleaved in two.
With more than a million copies sold of her beloved Throne of Glass series, Sarah J. Maass masterful storytelling brings this second book in her seductive and action-packed series to new heights.',
    '4.61',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Sarah J. Maas'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The House of Hades',
    '10/8/2013',
    'Hazel stands at a crossroads. She and the remaining crew of the Argo II could return home with the Athena Parthenos statue and try to stop Camp Half-Blood and Camp Jupiter from going to war. Or they could continue their quest to find the House of Hades, where they might be able to open the Doors of Death, rescue their friends Percy and Annabeth from Tartarus, and prevent monsters from being reincarnated in the mortal world. Whichever road they decide to take, they have to hurry, because time is running out. Gaea, the bloodthirsty Earth Mother, has set the date of August 1 for her rise to power.
Annabeth and Percy are overwhelmed. How will the two of them make it through Tartarus? Starving, thirsty, and in pain, they are barely able to stumble on in the dark and poisonous landscape that holds new horrors at every turn. They have no way of locating the Doors of Death. Even if they did, a legion of Gaeas strongest monsters guards the Doors on the Tartarus side. Annabeth and Percy cant exactly launch a frontal assault.
Despite the terrible odds, Hazel, Annabeth, Percy, and the other demigods of the prophecy know that there is only one choice: to attempt the impossible. Not just for themselves, but for everyone they love. Even though love can be the riskiest choice of all.
Join the demigods as they face their biggest challenges yet in The House of Hades, the hair-raising penultimate book in the best-selling Heroes of Olympus series.',
    '4.52',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Rick Riordan'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Worm',
    '11/19/2013',
    'An introverted teenage girl with an unconventional superpower, Taylor goes out in costume to find escape from a deeply unhappy and frustrated civilian life. Her first attempt at taking down a supervillain sees her mistaken for one, thrusting her into the midst of the local ‘cape scenes politics, unwritten rules, and ambiguous morals. As she risks life and limb, Taylor faces the dilemma of having to do the wrong things for the right reasons.
The story, titled Worm, takes the form of a web serial, posted in bite-sized reads in much the same way that authors such as Mark Twain would release their works one chapter at a time in the days before full-fledged novels. Worm started in June 2011, updating twice a week, and finished in late November, 2013. It totals roughly 1,750,000 words; roughly 26 typical novels in length (or 10-11 very thick novels).',
    '4.63',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Wildbow'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Feynman Lectures on Physics',
    '8/8/2005',
    'The revised edition of Feynmans legendary lectures includes extensive corrections and updates collated by Feynman and his colleagues. A new foreword by Kip Thorne, the current Richard Feynman Professor of Theoretical Physics at Caltech, discusses the relevance of the new edition to todays readers. This boxed set also includes Feynmans new Tips on Physics—the four previously unpublished lectures that Feynman gave to students preparing for exams at the end of his course. Thus, this 4-volume set is the complete and definitive edition of The Feynman Lectures on Physics. Packaged in a specially designed slipcase, this 4-volume set provides the ultimate legacy of Feynmans extraordinary contribution to students, teachers, researches, and lay readers around the world.',
    '4.6',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Richard P. Feynman'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Divan',
    '1/1/2003',
    'The Persian poet Hafez (1320-1389) is best known as a Sufi mystic who incorporated elements of Sufism into his verses. The state of God-Realisation is symbolised through union with a Beloved, and drinking the wine of spiritual love.
This compact version of the Divan of Hafez is a facsimile illuminated manuscript, complete with beautiful Persian calligraphy and miniature illustrations. There are 43 ghazals, translated into English by classical scholar Gertrude Bell. It is a truly beautiful introduction not only to the works of this beloved Sufi mystic, but also to the artistry of Mahmoud Farshchian. It is like getting two books in one: poetry and art.
Hafiz has no peer. — Goethe
Poetry is the greatest literary form of ancient Persia and modern Iran, and the fourteenth-century poet known as Hafiz is its preeminent master. Little is known about the poets life, and there are more legends than facts relating to the particulars of his existence. This mythic quality is entirely appropriate for the man known as The Interpreter of Mysteries and The Tongue of the Hidden, whose verse is regarded as oracular by those seeking guidance and attempting to realize wishes.
A mere fraction of what is presumed to have been an extensive body of work survives. This collection is derived from Hafizs Divan (collected poems), a classic of Sufism. The short poems, called ghazals, are sonnet-like arrangements of varied numbers of couplets. In the tradition of Persian poetry and Sufi philosophy, each poem corresponds to two interpretations, sensual and mystic.
This outstanding translation of Hafizs poetry was created by historian and Arabic scholar Gertrude Bell, who observed, These are the utterances of a great poet, the imaginative interpreter of the heart of man; they are not of one age, or of another, but for all time.',
    '4.64',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Hafez'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Nightingale',
    '2/3/2015',
    'In the quiet village of Carriveau, Vianne Mauriac says good-bye to her husband, Antoine, as he heads for the Front. She doesnt believe that the Nazis will invade France…but invade they do, in droves of marching soldiers, in caravans of trucks and tanks, in planes that fill the skies and drop bombs upon the innocent. When a German captain requisitions Viannes home, she and her daughter must live with the enemy or lose everything. Without food or money or hope, as danger escalates all around them, she is forced to make one impossible choice after another to keep her family alive.
Viannes sister, Isabelle, is a rebellious eighteen-year-old, searching for purpose with all the reckless passion of youth. While thousands of Parisians march into the unknown terrors of war, she meets Gaëtan, a partisan who believes the French can fight the Nazis from within France, and she falls in love as only the young can…completely. But when he betrays her, Isabelle joins the Resistance and never looks back, risking her life time and again to save others.
With courage, grace and powerful insight, bestselling author Kristin Hannah captures the epic panorama of World War II and illuminates an intimate part of history seldom seen: the womens war. The Nightingale tells the stories of two sisters, separated by years and experience, by ideals, passion and circumstance, each embarking on her own dangerous path toward survival, love, and freedom in German-occupied, war-torn France—a heartbreakingly beautiful novel that celebrates the resilience of the human spirit and the durability of women. It is a novel for everyone, a novel for a lifetime.',
    '4.57',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Kristin Hannah'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Queen of Shadows',
    '9/1/2015',
    'Everyone Celaena Sardothien loves has been taken from her. But shes at last returned to the empire—for vengeance, to rescue her once-glorious kingdom, and to confront the shadows of her past…
She has embraced her identity as Aelin Galathynius, Queen of Terrasen. But before she can reclaim her throne, she must fight.
She will fight for her cousin, a warrior prepared to die for her. She will fight for her friend, a young man trapped in an unspeakable prison. And she will fight for her people, enslaved to a brutal king and awaiting their lost queens triumphant return.
The fourth volume in the New York Times bestselling series continues Celaenas epic journey and builds to a passionate, agonizing crescendo that might just shatter her world.',
    '4.54',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Sarah J. Maas'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Gift',
    '8/1/1999',
    'More than any other Persian poet, it is perhaps Hafiz who accesses the mystical, healing dimensions of poetry. Because his poems were often ecstatic love songs from God to his beloved world, many have called Hafiz the Tongue of the Invisible.
With this stunning collection of 250 of Hafizs most intimate poems, Daniel Ladinsky has succeeded brilliantly in capturing the essence of one of Islams greatest poetic and religious voices. Each line of THE GIFT imparts the wonderful qualities of the spiritual teacher: an audacious love that empowers lives, profound knowledge, wild generosity, and a sweet, playful genius unparalleled in world literature.',
    '4.4',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Hafez'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Kindly Ones',
    '8/6/1999',
    'The Penultimate volume to the phenomenal Sandman series: distraught by the kidnapping and presumed death of her son, and believing Morpheus to be responsible, Lyta Hall calls the ancient wrath of the Furies down upon him. A former superheroine blames Morpheus for the death of her child and summons an ancient curse of vengeance against the Lord of Dream. The kindly ones enter his realm and force a sacrifice that will change the Dreaming forever. collecting The Sandman #57–69 and Vertigo Jam #1',
    '4.59',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Neil Gaiman'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Complete Sherlock Holmes',
    '10/1/1986',
    'A study in scarlet --
The sign of four --
Adventures of Sherlock Holmes : A scandal in Bohemia ; The red-headed league ; A case of identity ; The Boscombe Valley mystery ; The five orange pips ; The man with the twisted lip ; The adventure of the blue carbuncle ; The adventure of the speckled band ; The adventure of the engineers thumb ; The adventure of the noble bachelor ; The adventure of the beryl coronet ; The adventure of the copper beeches --
Memoirs of Sherlock Holmes : Silver blaze ; The yellow face ; The stock-brokers clerk ; The Gloria Scott ; The Musgrave ritual ; The Reigate puzzle ; The crooked man ; The resident patient ; The Greek interpreter ; The naval treaty ; The final problem --
The return of Sherlock Holmes : The adventure of the empty house ; The adventure of the Norwood builder ; The adventure of the dancing men ; The adventure of the solitary cyclist ; The adventure of the priory school ; The adventure of Black Peter ; The adventure of Charles Augustus Milverton ; The adventure of the six Napoleons ; The adventure of the three students ; The adventure of the golden pince-nez ; The adventure of the missing three-quarter ; The adventure of the abbey grange ; The adventure of the second stain. Volume 2. Introduction / by Loren D. Estleman --
The hound of the Baskervilles --
The valley of fear --
His last bow : The adventure of Wisteria Lodge : The singular experience of Mr. John Scott Eccles ; The tiger of San Pedro ; The adventure of the cardboard box ; The adventure of the red circle ; The adventure of the Bruce-Partington plans ; The adventure of the dying detective ; The disappearance of Lady Frances Carfax ; The adventure of the devils foot ; His last bow --
The case-book of Sherlock Holmes : The adventure of the illustrious client ; The adventure of the blanched soldier ; The adventure of the Mazarin stone ; The adventure of the three gables ; The adventure of the Sussex vampire ; The adventure of the three Garridebs ; The problem of Thor Bridge ; The adventure of the creeping man ; The adventure of the lions mane ; The adventure of the veiled lodger ; The adventure of Shoscombe old place ; The adventure of the retired colourman.',
    '4.47',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Arthur Conan Doyle'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Way of Kings, Part 2',
    '1/1/2011',
    'According to mythology mankind used to live in The Tranquiline Halls. Heaven. But then the Voidbringers assaulted and captured heaven, casting out God and men. Men took root on Roshar, the world of storms. And the Voidbringers followed ...
They came against man ten thousand times. To help them cope, the Almighty gave men powerful suits of armor and mystical weapons, known as Shardblades. Led by ten angelic Heralds and ten orders of knights known as Radiants, mankind finally won.
Or so the legends say. Today, the only remnants of those supposed battles are the Shardblades, the possession of which makes a man nearly invincible on the battlefield. The entire world is at war with itself - and has been for centuries since the Radiants turned against mankind. Kings strive to win more Shardblades, each secretly wishing to be the one who will finally unite all of mankind under a single throne.
On a world scoured down to the rock by terrifying hurricanes that blow through every few days is a young spearman, forced into the army of a Shardbearer, led to war against an enemy he doesnt understand and doesnt really want to fight.
What happened deep in mankinds past?
Why did the Radiants turn against mankind, and what happened to the magic they used to wield?',
    '4.79',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Quino'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Days Are Just Packed',
    '9/1/1993',
    'Zounds! Spaceman Spiff, Stupendous Man, the ferocious tiger Hobbes, and the rest of Calvins riotous imagination are all included in The Days Are Just Packed.
Calvin, the self-proclaimed Boy of Destiny, continues to save the universe with his alter egos, Spaceman Spiff and Stupendous Man, at least until Miss Wormwood or his mother bring him back to reality. Susie, Calvins nemesis and love interest, remains Calvins favorite target. And when hes not recovering from a ferocious tiger attack, Calvin creates hideous snowmen, plays a moral cat-and-mouse game with Santa, conducts his infamous Dad polls, and combats the monsters under his bed.',
    '4.68',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Bill Watterson'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Comedies, Histories, and Tragedies: A Facsimile of the First Folio, 1623',
    '4/22/1998',
    'The 1623 Folio of Shakespeares plays was the first collected edition of the Bards work. Many of Shakespeares plays appeared in print there for the first time. This photographic facsimile offers the actor, the director, and every lover of Shakespeare an opportunity to read a First Folio version of the plays, unaltered by modern scholarly editors. Doug Mostons introduction and glossary provide modern actors and readers with an understanding of how the Folio text can work today. His original line-numbering system, printed on each page of the facsimile, allows actors to move through the text with ease.',
    '4.57',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'William Shakespeare'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Season of Mists',
    '3/10/1999',
    'Ten thousand years ago, Morpheus condemned a woman who loved him to Hell. Now the other members of his immortal family, The Endless, have convinced the Dream King that this was an injustice. To make it right, Morpheus must return to Hell to rescue his banished love -- and Hells ruler, the fallen angel Lucifer, has already sworn to destroy him.',
    '4.54',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Neil Gaiman'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'The Wake',
    '9/3/1999',
    'When a Dream ends, there is only one thing left to do...
THE WAKE
In which the repercussions of the Death of Lord Morpheus are felt, and, in an epilogue, William Shakespeare learns the price of getting what you want.
This is the tenth and final volume of Neil Gaimans Sandman, described by author Mikal Gilmore in his introduction as nothing less than a popular culture masterpiece, and a work that is braver, smarter and more meaningful than just about anything high culture has produced during the same period.',
    '4.52',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Neil Gaiman'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Brief Lives',
    '5/1/1999',
    'Dreams youngest sister, the loopy Delirium, convinces him to go on a quest for their missing brother, Destruction. But Dream may learn that the cost of finding his prodigal sibling is more than he can bear.',
    '4.55',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Neil Gaiman'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Saga, Vol. 2',
    '7/2/2013',
    'The smash-hit ongoing epic continues! Thanks to her star-crossed parents Marko and Alana, newborn baby Hazel has already survived lethal assassins, rampaging armies, and alien monstrosities, but in the cold vastness of outer space, the little girl encounters something truly frightening: her grandparents!',
    '4.52',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Brian K. Vaughan'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Changes',
    '4/6/2010',
    'Long ago, Susan Rodriguez was Harry Dresdens lover-until she was attacked by his enemies, leaving her torn between her own humanity and the bloodlust of the vampiric Red Court. Susan then disappeared to South America, where she could fight both her savage gift and those who cursed her with it.
Now Arianna Ortega, Duchess of the Red Court, has discovered a secret Susan has long kept, and she plans to use it-against Harry. To prevail this time, he may have no choice but to embrace the raging fury of his own untapped dark power. Because Harrys not fighting to save the world...
Hes fighting to save his child.',
    '4.49',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Jim Butcher'
    )
  );
INSERT INTO books (
    book_title,
    book_pubdate,
    book_description,
    book_rating,
    author_id
  )
VALUES (
    'Cold Days',
    '11/27/2012',
    'You cant keep a good wizard down - even when he wants to stay that way.
For years, Harry Dresden has been Chicagos only professional wizard, but a bargain made in desperation with the Queen of Air and Darkness has forced him into a new job: professional killer.
Mab, the mother of wicked faeries, has restored the mostly-dead wizard to health, and dispatches him upon his first mission - to bring death to an immortal. Even as he grapples with the impossible task, Dresden learns of a looming danger to Demonreach, the living island hidden upon Lake Michigan, a place whose true purpose and dark potential have the potential to destroy billions and to land Dresden in the deepest trouble he has ever known - even deeper than being dead. How messed up is that?
Beset by his new enemies and hounded by the old, Dresden has only twenty four hours to reconnect with his old allies, prevent a cataclysm and do the impossible - all while the power he bargained to get - but never meant to keep - lays siege to his very soul.
Magic. It can get a guy killed.',
    '4.46',
    (
      SELECT author_id
      FROM authors
      WHERE author_name = 'Jim Butcher'
    )
  );
--select book_id, book_title, book_pubdate, book_rating, author_id from books order by book_id;