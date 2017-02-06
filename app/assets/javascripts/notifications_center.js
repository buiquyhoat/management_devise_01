$(document).ready(function()
{
    // open notification center on click
  $('#open_notification').click(function(){
    $('#notificationContainer').fadeToggle(300);
    $('#notification_count').fadeOut('fast');
    return false;
  });

    // hide notification center on click
  $(document).click(function(){
    if ($(this.activeElement).attr('id') === 'open_notification' ) {
      $('#open_notification').click();
    }else{
      $('#notificationContainer').hide();
    }

  });

  $('#notificationContainer').click(function(){
    return false;
  });

  $('#notificationContainer a').click(function(){
    window.location.href = $(this).attr('href');
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
          $('#notificationList a').click(function(){
            window.location.href = $(this).attr('href');
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
