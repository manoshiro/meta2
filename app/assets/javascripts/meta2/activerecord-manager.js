$(function() {
  $('#meta2_activerecord_section_selecter').on('change', function() {
    var rpath = $(this).data('path') + '?section=' + $(this).val();
    location.href = rpath;
  });
});
