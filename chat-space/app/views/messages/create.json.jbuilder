json.name @message.user.name
json.body @message.body
json.image @message.image.url(:thumb)
json.time @message.created_at

