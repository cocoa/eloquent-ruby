# there can only be one instance of a given symbol
a = :all
b = a
c = :all

# all true
a == c
a === c
a.eql?(c)
a.equal?(c)

# two diferent instances
x = "all"
y = "all"

# regular strings as hash keys
author = 'jules verne'
title = 'from earth to the moon'
hash = {author => title}

