define "prepare-results", ["./data"], (data) ->
  (input) ->
    income2016 = Math.round parseInt input.income
    income2017 = income2016 * 1.0453 # adjusted for inflation
    marriageAndChildStatus = input.marriage + input.children
  
    brackets = data.clinton[marriageAndChildStatus]
    bracketIndex = 0
    if income2017 > brackets[brackets.length - 1].i
      bracketIndex = brackets.length - 1
    if income2017 < brackets[0].i then bracketIndex = 0
    for currentBracket, index in brackets
      nextBracket = brackets[index+1]
      if income2017 > currentBracket.i and income2017 <= nextBracket.i
        bracketIndex = index+1
  
    results = 
      clinton: {}
      sanders: {}
      trump: {}
      cruz: {}
  
    for candidate, figures of results
    
      taxNow = data["current"][marriageAndChildStatus][bracketIndex].t
      taxUnderCandidate = data[candidate][marriageAndChildStatus][bracketIndex].t
      economicsThing = data["average"][marriageAndChildStatus][bracketIndex].t
    
      figures.payDifference = taxUnderCandidate - taxNow
      figures.taxRate = Math.round(taxUnderCandidate / economicsThing * 1e3) / 10
      
    results