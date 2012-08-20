#the purpose of this script is to follw up on a problem from the goedelEscherBach book -
#the MUI system
# can we proceed from the initial word MI to the word MU using just the 4 simple building rules:
# 1. MX -> MXX
# 2. Mxi -> Mxiu
# 3. Mxiiix -> Mxux
# 4. Mxuux -> Mxx
require "set"
require "pp"

def duplicate s
  s + s[1..-1]
end

def duplicate? s
  s.size < 10
end

def appendU s
  s[-1] == 'I' ? s + 'U' : s
end

def appendU? s
  s[-1] == 'I' && s.size < 10
end

def replaceIII s

  current = s.index('III', 1)
  results = []

  until current.nil?

    results << s[0..current - 1] + 'U' + s[current + 3..-1]
    current = s.index('III', current + 1)

  end
  results
end

def replaceIII? s
  s.index('III', 1).nil?
end

def deleteUU s

  current = s.index('UU', 1)
  results = Set.new # using a set as application on MUUU renders two identical result : MU

  until current.nil?

    results << s[0..current - 1] + s[current + 2..-1]
    current = s.index('UU', current + 1)

  end
  results
end

def deleteUU? s
  s.index('UU', 1).nil?
end


def process s
  results = Set.new

  if (duplicate? s)
    results.add duplicate(s)
  end
  if (appendU? s)
    results.add appendU(s)
  end
  replaceResult = replaceIII(s)
  unless replaceResult.empty?
    replaceResult.each { |w| results.add w }
  end
  deleteResult = deleteUU(s)
  unless deleteResult.empty?
    deleteResult.each { |w| results.add w }
  end
  results
end

def convert s, depth

  s.each { |w| p w }

  pp "converting #{s} in depth #{depth}"
  result = Set.new

  if (depth < 100)

    s.each { |word| process(word).each { |w| result.add w } }

    convert(result, depth + 1).each { |w| result.add w }

  end
  result
end


#do the same with slice and join


p duplicate("MUI")

p '----appendU'
p appendU("MUI")
p appendU("MIU")

p '----replaceIII'
p replaceIII "MIII"
p replaceIII "MIIII"
p replaceIII "MUIIIUIIIUIIIUIII"
p replaceIII "MUUUUUUUUUUU"
p replaceIII "MIIIIIIIIIIII"

#splitting does not work as expected - this returns a single 'M'
p "MIIIIIIIIIIII".split('III')

p '----deleteUU'
p deleteUU "MUU"
p deleteUU "MUIUUI"
p deleteUU "MUUU"

p deleteUU "MUIU"
p deleteUU "MIIIIIIIIIIII"


p '----process'
p process "MI"

p convert(%w{MI}, 0)