$(document).on 'ready page:load', ->
  $('#plan-tags').tagit
    fieldName:   'plan[tag_list]'
    singleField: true
    tagLimit: 10
    availableTags: gon.available_tags
    
  if gon.plan_tags?
    for tag in gon.plan_tags
      $('#plan-tags').tagit 'createTag', tag