$(document).ready ->
  $("#fileupload").fileupload({
    dataType: 'json',
    done: (e, data) ->
      file = data.result
      console.log(
        data.textStatus,
         file.id,
         file.thumb,
         file.picture_file_size
         )
    fail: (e, data) ->
      alert 'Upload Failed'
  })
