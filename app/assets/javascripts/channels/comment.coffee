App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    tag = document.createElement("li");
    text = document.createTextNode(data['message'][0]['message'] + " created by " + data['message'][1]['name']);
    tag.appendChild(text);
    element = document.getElementById("comments_list_" + data['message'][0]['event_id'])
    element.appendChild(tag)
    # tag = data['message']['message'] + "created by" + data['message'][''];
    # text = document.createTextNode();
    # tag.appendChild(text);
    # tag.href = "/events/" + data['message']['id'];
    # ul = document.getElementById("notifications");
    # li = document.createElement("li");
    # li.appendChild(tag);
    # ul.appendChild(li);

    # <%= comment.message %> created by <%= comment.user.name %>

    # {"message"=>{
    #   "id"=>10,
    #   "message"=>"check this out",
    #   "user_id"=>1,
    #   "event_id"=>14,
    #   "created_at"=>"2020-05-18T21:33:55.236Z",
    #   "updated_at"=>"2020-05-18T21:33:55.236Z"}}
    # {"message"=>[{"id"=>14, "message"=>"user check", "user_id"=>1, "event_id"=>12, "created_at"=>"2020-05-18T21:54:24.840Z", "updated_at"=>"2020-05-18T21:54:24.840Z"}, {"id"=>1, "name"=>"sujan dey", "email"=>"sdey@kreeti.com", "created_at"=>"2020-05-18T17:25:16.268Z", "updated_at"=>"2020-05-18T19:57