# The Hash class uses the eql? method to decide if two
#keys are in fact the same key

#The default hash method returns the object_id of the object, which is
#guaranteed to be unique

# hash Prime Directive—that if a.eql?(b) then
# a.hash == b.hash

require "../part2/document_identifier"
require "../part2/document_pointer"

hash = Hash.new

#DocumentIdentifier overrides hash and eql? methods -> correct hashing
doc_id1 = DocumentIdentifier.new("safqw", "wegfweg")
doc_id2 = DocumentIdentifier.new("safqw", "wegfweg")

p doc_id1 == doc_id2 # true
p doc_id1.eql? doc_id2  #true
p doc_id1.hash == doc_id2.hash #true

# DocumentPointer only overrides ==
doc_ptr1 = DocumentPointer.new("safqw", "wegfweg")
doc_ptr2 = DocumentPointer.new("safqw", "wegfweg")

p doc_ptr1 == doc_ptr2 # still true
p doc_ptr1.eql? doc_ptr2 # false -> is not overridden
p doc_ptr1.hash == doc_ptr2.hash # false -> not overridden

hash.store(doc_id1, "first")
hash.store(doc_id2, "second")
hash.store(doc_ptr1, "third")
hash.store(doc_ptr2, "fourth")

p hash[doc_id1]
p hash[doc_id2]
p hash[doc_ptr1]
p hash[doc_ptr2]