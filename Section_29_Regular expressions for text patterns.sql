-- SIMILAR TO

select 'same' similar to 'same'
select 'same' similar to 'e%'

-- POSIX
/*

~    (Matches RE, case sensitive)
~*   (Matches RE,case insensitive)
!~   (Does not match RE,case sensitive)
!~*  (Does not match RE, case insensitive)

*/

select 'same' ~ 'same' as result

-- SUBSTRING with regular expression

-- single chaaracter
select substring('The movie will start at 8pm on Dec 10, 2020.'from '.') /*(similar to _ )*/

-- all characters
select substring('The movie will start at 8pm on Dec 10, 2020.' from '.*') /*(similar to % )*/

-- any characters after 'movie'
select substring('The movie will start at 8pm on Dec 10, 2020.' from 'movie.+')

-- one or more word characters from the start
select substring('The movie will start at 8pm on Dec 10, 2020.' from '\w+')

-- one or more characters from the end
select substring('The movie will start at 8pm on Dec 10, 2020.' from '\w+.$')

-- let's get the year
select substring('The movie will start at 8pm on Dec 10, 2020.' from '\d{4}')

-- get either Nov or Dec
select substring('The movie will start at 8pm on Dec 10, 2020.' from 'Nov|Dec')

-- match data Dec 10,2020
select substring('The movie will start at 8pm on Dec 10, 2020.' from 'Dec \d{2}, \d{4}')

-- split delimited text to rows
select regexp_split_to_table('Adnan,James,Linda',',')

-- split delimited text to rows
select regexp_split_to_array('Adnan,James,Linda',',')