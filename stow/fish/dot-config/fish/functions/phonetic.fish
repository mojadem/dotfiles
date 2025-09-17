function phonetic
    set a alfa
    set b bravo
    set c charlie
    set d delta
    set e echo
    set f foxtrot
    set g golf
    set h hotel
    set i india
    set j juliet
    set k kilo
    set l lima
    set m mike
    set n november
    set o oscar
    set p papa
    set q quebec
    set r romeo
    set s sierra
    set t tango
    set u uniform
    set v victor
    set w whiskey
    set x x-ray
    set y yankee
    set z zulu
    set 0 zero
    set 1 one
    set 2 two
    set 3 three
    set 4 four
    set 5 five
    set 6 six
    set 7 seven
    set 8 eight
    set 9 nine

    for c in (string split '' $argv)
        echo $c as in $$c
    end
end
