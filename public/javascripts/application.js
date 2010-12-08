$(function() {
  $('#elements').sortable({
    opacity: 0.5,
    scroll: true,
    update: function() {
      $.ajax({
        type: 'post',
        data: $('#elements').sortable('serialize'),
        dataType: 'script',
        url: '/pages/' + $('#content').attr('data-page') + '/elements/sort'
      });
    }
  });
});
