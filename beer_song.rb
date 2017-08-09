module BookKeeping
	VERSION = 2
end

class BeerSong
	require 'rubygems'
	require 'active_support/inflector'

	def initialize
	end

	def pluralize(number, text)
	  return number.to_s + " " + text.pluralize if number > 1
	  number.to_s + " " + text
	end

	def verse(n)
		if n > 1
			b = pluralize(n, 'bottle')
			c = pluralize(n - 1, 'bottle')
			"#{b} of beer on the wall, #{b} of beer.\n"\
			"Take one down and pass it around, #{c} of beer on the wall.\n"
		elsif n == 1
			"1 bottle of beer on the wall, 1 bottle of beer.\n"\
			"Take it down and pass it around, no more bottles of beer on the wall.\n"
		else
			"No more bottles of beer on the wall, no more bottles of beer.\n"\
			"Go to the store and buy some more, 99 bottles of beer on the wall.\n"
		end
	end

	def verses(x,y)
		array = [*y..x].reverse
		stanza = array.map { |k| verse(k) } * "\n"
	end

	def lyrics
		verses(99,0)
	end
end
