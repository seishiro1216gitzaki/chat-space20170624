$(function() {
var search_list = $(".user-search-result");

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
                 <p class="chat-group-user__name">${user.name}</p>
                 <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
               </div>`
    search_list.append(html);
  }

  function AfterNoUser(user) {
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user}</p>
                </div>`
    search_list.append(html);
  }

  function appendMember(user) {
    var users_list = $("#chat-group-users");
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value=${user.attr('data-user-id')}>
                  <p class='chat-group-user__name'>${user.attr('data-user-name')}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    users_list.append(html);
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
       users.forEach(function(user){
         appendUser(user);
       });
      }
      else {
        AfterNoUser("ユーザーがいません");
      }
    })

    .fail(function() {
      alert('error')
    })
  })
    $(".user-search-result").on("click", ".chat-group-user__btn", function() {
      $(this).parent().remove();
        appendMember($(this));
    })

    $("#chat-group-users").on("click", ".chat-group-user__btn", function() {
      $(this).parent().remove();
    })
});
