define "get-user-input", ["jquery"], ($) ->
  (callback) -> # parsed input will be bound to this
    $(document).ready ->
      $( "form" ).on "submit", (event) ->
        event.preventDefault()

        input = {}
        rawFormInput = $('#user-income').serializeArray()
        input[field["name"]] = field["value"] for field in rawFormInput
        
        console.log input
        callback.call input