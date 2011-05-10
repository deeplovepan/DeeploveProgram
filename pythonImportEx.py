# use function hello defined in test.py
import test
test.hello()

# use function hello defined in test.py
from test import hello
hello()

# use function hello defined in test1/test.py
import sys
sys.path.append('./test1')
from test import hello
hello()
          