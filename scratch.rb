require('./lib/new_hash.rb')

foo = NewHash.new()
foo.newStore('a', 'boy')
foo.newStore('c', 'dog')
bar = NewHash.new()
bar.newStore('a', 'bat')
bar.newStore('c', 'dingo')

foo.newMerge(bar)
