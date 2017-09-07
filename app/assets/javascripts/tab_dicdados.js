jQuery(function() {
  $('#dicdado_tab').parent().hide();
  const tab = $('#dicdado_tab').html();



  refiltraTabs = function() {
    const tipoci = $('#dicdado_tipoci_id :selected').text();
    const escaped_tipoci = tipoci.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    const options = $(tab).filter(`optgroup[label='${escaped_tipoci}']`).html();
    if (options) {
      $('#dicdado_tab').html(options);
      return $('#dicdado_tab').parent().show();
    } else {
      $('#dicdado_tab').empty();
      return $('#dicdado_tab').parent().hide();
    }
  }

  $( document ).ready(refiltraTabs);

  return $('#dicdado_tipoci_id').change(refiltraTabs);
});
