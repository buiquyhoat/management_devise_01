
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require dms
//= require chosen-jquery
//= require i18n
//= require i18n/translations
//= require jquery.transit.min
//= require bootstrap-datepicker
//= require Chart.bundle
//= require jquery.remotipart
//= require custom
//= require_tree .

I18n.defaultLocale = I18n.default_locale ;
I18n.locale = I18n.locale;

$(document).ready(function() {
  $('body').on('change', 'input[type=radio][name=printed_code]', function() {
    var bought_date = "";

    if($('#device_bought_date').val() == "2017-01-01"){
      bought_date = $('#device_bought_date').val().split('-').join("");
    }else{
      bought_date = $('#device_bought_date').val().split('/').join("");
    }

    var orginal_price = parseInt($('#device_original_price').val());
    var device_code = $('#device_device_code').val();

    var printed_code = device_code + '|' + bought_date + '|' + orginal_price;
    $('#tr-printed-code').show();
    $('#device_printed_code').val(printed_code);
  });

  $('body').on('click', '.btn-generate', function() {
    var printed_code = $('#device_printed_code').val();
    load_printed_code(printed_code);
  });

  $('body').on('click', 'input[type=radio][name=printed_code_show]', function() {
    return false;
  });

  function load_printed_code(printed_code){
    if($('#image-printed-code') !== null) $('#image-printed-code').remove();

    var type_printed_code = $('input[type=radio][name=printed_code]').val();
    var url = '';

    if(type_printed_code == 'barcode'){
      url = '/api/devices/';
    }else if (type_printed_code == 'qrcode'){
      url = '/api/devices/';
    }

    $.ajax({
      url: url,
      data: {
        printed_code: printed_code
      },
      method: "GET",
      success: function(result){
        $('#div-printed-code').css('display', 'block');
        $('#div-printed-code').append(result);
      }
    });
  }
});
