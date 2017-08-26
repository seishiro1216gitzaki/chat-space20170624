$(function(){
  function buildHTML(message){
    var image =(message.image != null) ? `<img src="${message.image}">` : ""
    var html =`
      <div class= "body-content__clearfix" data-message-id="${message.id}">
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
          ${image}
        </div>
      </div>`
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
        $('.message, .image').val('');
        $('.body').animate({scrollTop: $('.body').get(0).scrollHeight}, 'fast');
      })
      .fail(function(){
        alert('送信に失敗しました');
    })
      return false
  });


  var interval = setInterval(function() {
      if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      dataType: 'json'
    })
    .done(function(json) {
      var id = $(".body-content__clearfix:last").data('messageId');
      var insertHTML = '';
      json.messages.forEach(function(message) {
        if (message.id > id ) {
          insertHTML += buildHTML(message);
        }
      });
      $('.body-content').append(insertHTML);
    })
    .fail(function(data) {
      alert('自動更新に失敗しました');
    });
  } else {
    clearInterval(interval);
   }} , 5 * 1000 );

});
