a_string_with_a_quote = 'Say it ain\'t so!'
a_string_with_a_backslash = 'This is a backslash: \\'

double_quoted = "I have a tab: \t and a newline: \n"

author = "Ben Bova"
title = "Mars"
puts "#{title} is written by #{author}"

# quotes
str = "\"Stop\", she said, \"I cannot deal with the backslashes.\""
str = '"Stop", she said, "I cannot deal with the backslashes."'
str = '"Stop", she said, "I can\'t live without \'s and "s."'

# delimiters (single-quote style treatment)
str = %q{"Stop", she said, "I can't live without 's and "s."}
str = %q("Stop", she said, "I can't live without 's and "s.")
str = %q<"Stop", she said, "I can't live without 's and "s.">
str = %q$"Stop", she said, "I can't live without 's and "s."$

# delimiters (doubled-quoted style)
str = %Q<The time in now #{Time.now}>

# line span
a_multiline_string = "a multi-line
string"
another_one = %q{another multi-line
string}
yet_another = %Q{another multi-line string with \
no newline}
heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF






