// Bootstrap date picker
$(document).ready(function() {
  $('#project_due_date').datepicker({
    format: 'yyyy-mm-dd'
  });
});

// jQuery chosen
$('#project_member_ids').chosen({
  disable_search_threshold: 10
});

dataConfirmModal.setDefaults({
  title: 'Delete Record (Carefull)',
  text: 'Are you sure want to delete this record?'
});
