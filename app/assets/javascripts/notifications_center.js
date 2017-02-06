$(document).ready(function()
{
    // open notification center on click
  $('#open_notification').click(function(){
    open_notification();
    return false;
  });

    // hide notification center on click
  $(document).click(function(){
    if ($(this.activeElement).attr('id') === 'open_notification' ) {
      open_notification();
      return false;
    }else{
      $('#notificationContainer').hide();
    }
  });

  (function() {
    var user_id = parseInt($('#user_id').val());
    if (user_id > 0) {
      App.notifications = App.cable.subscriptions.create({
        channel: 'NotificationsChannel',
        user_id: user_id
      },
      {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          sound = document.getElementById('notification_sound');
          sound.volume = 0.04;
          sound.play();
          $('#notificationList').prepend('' + data.notification);
          $('#notificationList li').click(function(){
            window.location.href = $(this).find('a').first().attr('href');
          });

          return this.update_counter(data.counter);
        },
        update_counter: function(counter) {
          var $counter, val;
          $counter = $('#notification-counter');
          val = parseInt($counter.text());
          val++;
          return $counter.css({
            opacity: 0
          }).text(val)
            .css({
              top: '-10px'
            })
            .transition({
              top: '10px',
              opacity: 1
            });
        }
      });
    }
  }).call(this);
});

function open_notification(){
  $('#notificationContainer').fadeToggle(300);
  $('#notification_count').fadeOut('fast');
}
