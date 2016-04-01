define "main", ["./setup-page", "./get-user-input", "./prepare-results", "./display-results"], (setupPage, onGetInput, prepareResults, displayResults) ->
  setupPage()
  onGetInput -> 
    results = prepareResults @
    displayResults results
