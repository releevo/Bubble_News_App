# dashboard

get '/users/:id' do
  redirect '/login' unless logged_in?
  @user = User.find(params[:id])
  redirect '/' unless current_user.id == @user.id
  @notifications = Notification.where(receiver_id: current_user.id)
  erb :users
end

delete '/api/notifications/:id' do
  notification = Notification.find(params[:id])
  notification.delete
  # content_type :json
  # {message: 'deleted successfully'}.to_json
  # normally would put notification.to_json
  # redirect "/users/#{current_user.id}"
  # /notifications/:id
end

# find_by - only finds the first one like querySelector

# var handleClick = event => {
#   if (event.target.classList.contains('star')) {
#     // var card = event.target.closest('.ui-card')
#     // var span = card.querySelector('.like-count')
#     // span.textContent = Number(span.textContent) + 1;
#     // console.log('dish_id', event.target.dataset.dishId)
#     $.ajax({
#       url: "/api/likes",
#       method: "post",
#       data: {
#         dish_id: event.target.dataset.dishId
#       }
#     }).done(response => {
#       var card = event.target.closest('.ui-card')
#       var span = card.querySelector('.like-count')
#       span.textContent = response.like_count
#     #  //this now ensures that the like was sent to the database as we are asking for a reposnse.
#     })
#   }
# }

# //server run file.  So if script is down the bottom of the page you can use crab hands.
# //this is client side and its JS - ajax talks to a server.  Even our own server.
# //http://localhost:4567 dont need the start becuase it is the SAME domain.
# //servers dont redirect they send you JSON.  However can redirect once done. window.location.href = '' - you can force the redirect.
# //getAttribute('data-dish-id)
# //dataset.dishId

# containerDiv.addEventListener('click', handleClick)
#   // var stars = document.querySelectorAll('.star') //query selector only finds the first
#   // var likeCount = document.querySelector('.like-count')

#   // stars.forEach(function(star) {
#   //   star.addEventListener('click', function(event) {
#   //     var card = event.target.closest('.ui-card')
#   //     var span = card.querySelector('.like-count')
#   //     span.textContent = Number(span.textContent) + 1;
#   //   })
#   // })
# </script>
