$(document).on('turbolinks:load',function(){
  
  $('#formKeywordInput').tagsInput({
    'autocomplete_url': "/keywords/autocomplete.json",
    'autocomplete': {
      focus: function(event, ui){
        $('#formKeywordInput_tag').val(ui.item.name);
        return false;
      },
      select: function(event, ui) {
        $('#formKeywordInput').addTag(ui.item.name);
        return false;
      }
    },
    'onAddTag': function(){
      $('#formKeywordInput_tag').removeClass('not_valid')
      $('#formKeywordInput_tag').focus();
      return false;
    },
    'height:': '45px',
    'width': '100%',
    'defaultText': ''
  })
 
  if($("#formKeywordInput_tag").length){
    $('#formKeywordInput_tag').data('ui-autocomplete')._renderItem = function(ul, item) {
      return $('<li class="w-200">').data('item.autocomplete', item).append('<a class="w-200 d-flex">' + item.name + '  (' + item.count +')　</a>')
        .appendTo(ul);
    }
  }
  $('#formKeywordInput_tag').attr('placeholder', '例）ペット ファミリー向け 日帰り');
});