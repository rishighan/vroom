Dropzone.options.fileDropzone =
  paramName: "photo"
  maxFilesize: 2 #mb
  addRemoveLinks: true
  init: ->
    @on 'removedfile', (file) ->
      if file.xhr
        $.ajax
          url: "#{$("#photo-dropzone").attr "action"}/#{JSON.parse(file.xhr.response).id}"
          type: 'DELETE'
