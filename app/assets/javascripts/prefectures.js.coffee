$(document).on 'turbolinks:load', ->
  replaceSelectOptions = ($select, results) ->
    $select.html $('<option>')
    $.each results, ->
      option = $('<option>').val(this.id).text(this.name)
      if this.path
        option.data('path', this.path)
      $select.append(option)

#都道府県から市区町村
  replaceChildrenOptions = ->
    childrenPath = $(@).find('option:selected').data().childrenPath
    $selectChildren = $(@).closest('form').find('.select-children')
    if childrenPath?
      $.ajax
        url: childrenPath
        dataType: "json"
        success: (results) ->
          replaceSelectOptions($selectChildren, results)
        error: (XMLHttpRequest, textStatus, errorThrown) ->
          console.error("Error occurred in replaceChildrenOptions")
          console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
          console.log("textStatus: #{textStatus}")
          console.log("errorThrown: #{errorThrown}")
    else
      replaceSelectOptions($selectChildren, [])

#市区町村からスポット
  replaceGrandChildrenOptions = ->
    grandchildrenPath = $(@).find('option:selected').data().Path
    $selectGrandChildren = $(@).closest('form').find('.select-grandchildren')
    console.log($(@).find('option:selected').data().Path)

    if grandchildrenPath?
      $.ajax
        url: grandchildrenPath
        dataType: "json"
        success: (results) ->
          replaceSelectOptions($selectGrandChildren, results)
        error: (XMLHttpRequest, textStatus, errorThrown) ->
          console.error("Error occurred in replaceChildrenOptions")
          console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
          console.log("textStatus: #{textStatus}")
          console.log("errorThrown: #{errorThrown}")
    else
      replaceSelectOptions($selectGrandChildren, [])

  $('.select-parent').on
    'change': replaceChildrenOptions

  $('.select-children').on 
    'change': replaceGrandChildrenOptions