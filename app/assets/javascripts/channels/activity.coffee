App.activity = App.cable.subscriptions.create "ActivityChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # tag = document.createElement("p");
    # text = document.createTextNode(data['message']['message']);
    # tag.appendChild(text);
    # $('#events')[0].prepend tag
    tag = document.createElement('a');
    text = document.createTextNode("You have 1 new notification");
    tag.appendChild(text);
    tag.href = "/events/" + data['message']['id'];
    ul = document.getElementById("notifications");
    li = document.createElement("li");
    li.appendChild(tag);
    ul.appendChild(li);
    span = document.getElementById("notification-dot")
    span.className += "dot";