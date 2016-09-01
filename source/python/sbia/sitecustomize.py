# # http://stackoverflow.com/questions/9942594/unicodeencodeerror-ascii-codec-cant-encode-character-u-xa0-in-position-20
# # http://masasuzu.hatenablog.jp/entry/20110313/1299997912
# import sys

# #| reload is somehow needed to get ``setdefaultencoding`` method
# #| http://stackoverflow.com/questions/2276200/changing-default-encoding-of-python
# reload(sys)

# # default is 'ascii', which raises EncodingError with some programs that uses UTF-8.
# sys.setdefaultencoding('UTF8')