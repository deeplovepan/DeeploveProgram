# \d: Matches any decimal digit; this is equivalent to the class [0-9]
# \D: Matches any non-digit character; this is equivalent to the class [^0-9]
# \s: Matches any whitespace character; this is equivalent to the class [ \t\n\r\f\v]
# \S: Matches any non-whitespace character; this is equivalent to the class [^ \t\n\r\f\v]
# \w: Matches any alphanumeric character; this is equivalent to the class [a-zA-Z0-9_]
# \W: Matches any non-alphanumeric character; this is equivalent to the class [^a-zA-Z0-9_]


# search 
# Scan through a string, looking for any location where this RE matches
#ex:
import re
pattern = re.compile('ab*')
print pattern.search("abcd")
->
<_sre.SRE_Match object at 0x1004efcc8>
print pattern.search("fff")
->
None
