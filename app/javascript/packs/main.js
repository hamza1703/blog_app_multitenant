$(document).on('keyup',function(){
  $("#company_name").keyup(function(){
    $('#subdomain').html($(this).val()+".localhost:3000");
    $('#subdomain_value').val($(this).val().replaceAll(/\s/g,'').toLowerCase());
   })
})
