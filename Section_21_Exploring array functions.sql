-- ARRAY

-- comparision operators
-- =,<>,<,>,<=,>=

select 
	array[1,2,3,4] = array[1,2,3,4],
	array[1,2,3,4] <> array[5,2,3,4],
	array[1,2,3,4] < array[2,3,4,5]

-- inclusion operators

select 
	array[1,2,3,4] @> array[2,3,4] as "Contains",
	array['a','b'] <@ array['a','b','c'] as "Contained by",
	array[1,2,3,4] && array[2,3,4] as "Is overlap"

-- array dimensions

select 
	array_ndims(array[[1],[2]]) as "Dimensions",
	array_ndims(array[[1,2,3],[4,5,6]]) as "Dimensions"

-- concatenation

select array[1,2,3] || array[4,5,6] as "Combine arrays"
select array_cat(array[1,2,3],array[4,5,6]) as "Combine arrays via array_cat"

-- add item to array

select 4 || array[1,2,3] as "Adding to an array"
select array_prepend(4,array[1,2,3]) as "Using prepand"

select array[1,2,3] || 4  as "Adding to an array"
select array_append(array[1,2,3],4) as "Using append"

-- array length
-- array_length(anyarray,int)
select array_length(array[1,2,3,4],1)

select array_lower(array[5,6,7,8]) -- return lower bound

select array_upper(array[5,6,7,8]) -- return upper bound

-- cardinality(array)
-- returns the cardinality of the array dimensions or total number of elements in an array
select cardinality(array[[1],[2],[3],[4],[5]])

-- array search functions

select array_position(array['Jan','Feb','Mar','Apr'],'Feb')
select array_positions(array[1,2,2,3,4],2) -- for multiple values

--remove
select array_remove(array[1,5,4,4,3],4)

-- replace
select array_replace(array[2,4,3,5,2,7],2,9)

-- ALL
select 25 = all(array[20,25,30,15]) as "Results"
select 25 = all(array[25,25]) as "Results"

-- ANY
select 25 = any(array[20,25,30,15]) as "Results"

-- string to array
select string_to_array('1,2,3,4',',')

-- array to string
select array_to_string(array[1,2,3,4],',')

-- unnest(anyarray)
-- function is used to expand an array to a set of rows


