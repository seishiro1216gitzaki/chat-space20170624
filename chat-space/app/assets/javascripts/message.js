$(function(){
  function buildHTML(message){
    if (message.image != null) {
    var html =`
    <div class= "body-content__clearfix">
      <div class= "body__name">
        ${message.name}
      </div>
      <div class= "body__time">
        ${message.time}
      </div>
      <div class= "body__message">
        ${message.body}
      </div>
      <div class= "body__image">
        <img src=${ message.image}>
      </div>
   </div>`
   }
   else{
    var html =`
    <div class= "body-content__clearfix">
      <div class= "body__name">
        ${message.name}
      </div>
      <div class= "body__time">
        ${message.time}
      </div>
      <div class= "body__message">
        ${message.body}
      </div>
   </div>`
   }
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.body-content').append(html)
      $('.message').val('');
      $('.image').val('');
      $('.body').scrollTop(0);
      $('.body').animate({scrollTop: $('.body').get(0).scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('送信に失敗しました');
    })
    return false
  });
});
