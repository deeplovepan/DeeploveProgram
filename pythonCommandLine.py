import sys

for arg in sys.argv: 
    print arg

ex:
python test.py andy
->  sys.argv[0] = test.py
	sys.argv[1] = andy
