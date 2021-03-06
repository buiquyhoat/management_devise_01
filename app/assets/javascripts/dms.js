
(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
    var timeout;
      return function debounced () {
        var obj = this, args = arguments;
        function delayed () {
          if (!execAsap)
            func.apply(obj, args);
          timeout = null;
        }

        if (timeout)
          clearTimeout(timeout);
        else if (execAsap)
          func.apply(obj, args);
        timeout = setTimeout(delayed, threshold || 100);
      };
  };
    // smartresize
  jQuery.fn[sr] = function(fn){
      return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr);};
})(jQuery,'smartresize');

// Sidebar
$(document).ready( function() {
  var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
  $BODY = $('body'),
  $MENU_TOGGLE = $('#menu_toggle'),
  $SIDEBAR_MENU = $('#sidebar-menu'),
  $SIDEBAR_FOOTER = $('.sidebar-footer'),
  $LEFT_COL = $('.left_col'),
  $RIGHT_COL = $('.right_col'),
  $NAV_MENU = $('.nav_menu'),
  $FOOTER = $('footer');
  // TODO: This is some kind of easy fix, maybe we can improve this
  var setContentHeight = function () {
    // reset height
    $RIGHT_COL.css('min-height', $(window).height());

    var bodyHeight = $BODY.outerHeight(),
      footerHeight = $BODY.hasClass('footer_fixed') ? -10 : $FOOTER.height(),
      leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
      contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;
    // normalize content
    contentHeight -= $NAV_MENU.height() + footerHeight;
    $RIGHT_COL.css('min-height', contentHeight);
  };

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
    var $li = $(this).parent();

    if ($li.is('.active')) {
      $li.removeClass('active active-sm');
      $('ul:first', $li).slideUp(function() {
        setContentHeight();
      });
    } else {
      // prevent closing menu if we are on child menu
      if (!$li.parent().is('.child_menu')) {
        $SIDEBAR_MENU.find('li').removeClass('active active-sm');
        $SIDEBAR_MENU.find('li ul').slideUp();
      }
      $li.addClass('active');
      $('ul:first', $li).slideDown(function() {
        setContentHeight();
      });
    }
  });

    // check active menu
  $SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li')
    .addClass('current-page');

  $SIDEBAR_MENU.find('a').filter(function () {
    return this.href == CURRENT_URL;
  }).parent('li').addClass('current-page').parents('ul').slideDown(function() {
      setContentHeight();
  }).parent().addClass('active');

  // recompute content when resizing
  $(window).smartresize(function(){
    setContentHeight();
  });

  setContentHeight();

  // fixed sidebar
  if ($.fn.mCustomScrollbar) {
    $('.menu_fixed').mCustomScrollbar({
      autoHideScrollbar: true,
      theme: 'minimal',
      mouseWheel:{ preventDefault: true }
    });
  }

  setup_date_picker();
  set_up_chosen();
  setup_chart();
  $('#show_form_login').on('click',function(){
    if($('#form_login').css('display') === 'block'){
      $('#form_login').slideUp();
    }
    else{
      $('#form_login').slideDown();
    }
  });

  $('#show_form_language').on('click',function(){
    if($('#form_language').css('display') === 'block'){
      $('#form_language').slideUp();
    }
    else{
      $('#form_language').slideDown();
    }
  });

  $('#notificationContainer li').click(function(){
    window.location.href = $(this).find('a').first().attr('href');
  });

  $('#list-setting .user-setting').change(function() {
    var setting_name = $(this).attr('id')
    $('#hd-'+ setting_name).val(setting_name + ':' + $(this).val())
  })

});

$(document).ajaxStart(function(){
  $('button[type="submit"]').prop('disabled', 'disabled')
});

$(document).ajaxStop(function(){
  $('button[type="submit"]').prop('disabled', null)
});

function changeSearchForm(){
  $('#form-submit').submit();
};
function groupChange(url, source_dropdow_id, target_dropdow_id) {
  var source_id = $('#'+source_dropdow_id).val()
  $.ajax({
    url: url + '?id=' + source_id,
    type: 'get',
    dataType: 'json',
    success: function(data) {
      var options = $('#' + target_dropdow_id);
      $(options).html('')
      $.each(data, function () {
        options.append($('<option />').val(this.id).text(this.name));
      });
      options.trigger('chosen:updated');
      options.change()
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(thrownError);
    }
  });
}

function set_up_chosen(){
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: I18n.t("action_message.result_not_match"),
    width: '100%'
  });
}

function assignmentDropChange(url, source, class_target){
  var idDropSource = $(source).attr('id')
  var idTarget = $(source).closest('tr').find('.'+ class_target).attr('id')
  if (idDropSource !== undefined && idTarget !== undefined) {
     groupChange(url,idDropSource,idTarget);
  }
}

function removeAssignmentDevice(button){
  $(button).closest('tr').remove();
  resetIndexAssignmentDetail();
}

function resetIndexAssignmentDetail(){
  $('#tbl-assignment-detail tbody tr').each(function(index) {
    var groupCategoryDropdown = $(this).find('.device-group')
    var deviceCategoryDropdown = $(this).find('.device-caterory')
    var devideDropdown = $(this).find('.device')

    $(groupCategoryDropdown).attr('id', 'group_id_' + index)
    $(deviceCategoryDropdown).attr('id', 'device_category_id_' + index)
    $(devideDropdown).attr('id', 'device_id_' + index)

    $(devideDropdown).attr('name', 'assignment[assignment_details_attributes][' + index + '][device_id]')
  });
}

function submitForm(){
  var isValid = true
  $('.device').each(function(index) {
    var deviceId = $(this).val()
    if (deviceId === null || deviceId === undefined) {
      isValid = false;
    }
  });

  if (isValid) {
    $('#new_assignment').submit();
  }
  else {
    $('#error').html('')
    $('#error').append('<div id="error_explanation">' +
      '<div class="alert alert-danger">' + I18n.t("action_message.assignment_details_total_error") + ' </div>' +
      '<ul><li>' + I18n.t("assignment.message.device_duplicate") + '</li></ul>' +
      '</div>')
  }
};

function getDeviceCode(url) {
  var device_category_id =  $('.device-category').val()
  var current_category_id = $('#current_category_id').val()
  if (current_category_id !== device_category_id) {
    $.ajax({
      url: url + '?device_category_id=' + device_category_id,
      type:'get',
      dataType: 'json',
      success: function(data) {
        $('.device-code').val(data.device_code)
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError);
      }
    });
  }else{
    $('.device-code').val($('#current_code').val())
  }
}

function setup_date_picker(){
  $('.datepicker').datepicker({
    format: 'yyyy/mm/dd'
  });
}

function clear_text_box_search(){
  $('#key_search').val(''); changeSearchForm();
}

function user_setting_submit(){
  $('#form-user-setting').submit();
  $('#form-user-group').submit();
}

function setup_chart(){
  request_chart();
  device_chart();
}

String.prototype.format = function (){
    var args = arguments;
    return this.replace(/\{\{|\}\}|\{(\d+)\}/g, function (curlyBrack, index) {
        return ((curlyBrack == "{{") ? "{" : ((curlyBrack == "}}") ? "}" : args[index]));
    });
};

function chart_url(type){
  return "/dashboard_chart?type={0}".format(type);
}

function request_chart(){
  if ($("#request_cycle").length > 0) {
    var options = {
      legend: false,
      responsive: false
    };
    $.ajax({
      type: 'GET',
      url: chart_url(1),
      dataType: 'json',
      success: function(data){
        if (data.success === false)
        {
          alert(I18n.t("dashboard.request.chart_error"));
        }
        else
        {
          chartobj= JSON.parse(data.message)
          new Chart(document.getElementById("canvas1"), {
            type: chartobj.type,
            tooltipFillColor: "rgba(51, 51, 51, 0.55)",
            data: {
              labels: chartobj.labels,
              datasets: [{
                data: chartobj.data,
                backgroundColor: chartobj.backgroundColor,
                hoverBackgroundColor: chartobj.hoverBackgroundColor
              }]
            },
            options: options
          });
        }
      },
      error: function (error_message){
        alert(error_message);
      }
    });
  }
}

function device_chart(){
  if ($("#device_cycle").length > 0) {
    var options = {
      legend: false,
      responsive: false
    };
    $.ajax({
      type: 'GET',
      url: chart_url(2),
      dataType: 'json',
      success: function(data){
        if (data.success === false)
        {
          alert(I18n.t("dashboard.device.chart_error"));
        }
        else
        {
          chartobj= JSON.parse(data.message)
          new Chart(document.getElementById("device_canvas"), {
            type: chartobj.type,
            tooltipFillColor: "rgba(51, 51, 51, 0.55)",
            data: {
              labels: chartobj.labels,
              datasets: [{
                data: chartobj.data,
                backgroundColor: chartobj.backgroundColor,
                hoverBackgroundColor: chartobj.hoverBackgroundColor
              }]
            },
            options: options
          });
        }
      },
      error: function (error_message){
        alert(error_message);
      }
    });
  }
}
function minmax(obj, min, max){
  var value = parseInt($(obj).val())
  if(value < min || isNaN(value)){
    alert(I18n.t("action_message.min_value", {value: min}))
    value = min;
  }
  else if(value > max){
    alert(I18n.t("action_message.max_value", {value: max}))
    value =  max;
  }
  $(obj).val('')
  $(obj).val(value)
}

function validateFiles(inputFile, allowedExtension) {
  var maxExceededMessage = I18n.t("import.validate.max_length")
  var extErrorMessage =  I18n.t("import.validate.file_type_Import_device",
    {extension: allowedExtension.join()})

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;

  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    window.alert(maxExceededMessage);
    $(inputFile).val('');
  };

  if (extError) {
    window.alert(extErrorMessage);
    $(inputFile).val('');
  };
}
