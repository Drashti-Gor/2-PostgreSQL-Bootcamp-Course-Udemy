-- tsvector
-- tsvector will store words like washes, washed and washing as wash

select to_tsvector('washes')
select to_tsvector('The quick brown fox jumped over the lazy dog.')
"'brown':3 'dog':9 'fox':4 'jump':5 'lazi':8 'quick':2"

-- tsquery
-- tsquery is checked under tsvector

-- Operators
/*
@@  Match operator
&, |, !  AND, OR, NOT
<-> search for adjacent words or words a certain distance apart
*/

select to_tsvector('This is a lamp')
	@@ to_tsquery('lamp')
	
select to_tsvector('The quick brown fox jumped over the lazy dog.')
	@@ to_tsquery('foxes') -- variation of fox so true
	
select to_tsvector('The quick brown fox jumped over the lazy dog.')
	@@ to_tsquery('foxtrot') -- not a variation of fox so false

select to_tsvector('The quick brown fox jumped over the lazy dog.')
	@@ to_tsquery('fox & dog')

	
