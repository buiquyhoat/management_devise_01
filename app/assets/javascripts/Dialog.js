var PopupDialog = {
  Stack: [],
  Result: null,
  Show: function (url, functionCallback, title, width, height, closeable, openCallback, functionBeforeClose, continueClose) {
    if (closeable == null) closeable = true;
    if (continueClose == null || continueClose == undefined) continueClose = true;
    //var div = "<div id='divDialog'></div>";
    var div = $('#divDialog' + PopupDialog.Stack.length);
    if (div.length == 0) {
      div = "<div id='divDialog" + PopupDialog.Stack.length + "'></div>";
    }
    if (width == null) width = 'auto';
    if (height == null) height = 'auto';
    $(div).html('');

    $.ajax({
      url: url,
      async: false,
      dataType: "html",
      success(data){
       var div = "<div id='divDialog'>"+data+"</div>";
         PopupDialog.Result = null;
        $(div).dialog({
          modal: true,
          height: height,
          width: '100%',
          maxWidth: width,
          autoOpen: false,
          fluid: true,
          resizable: false,
          draggable: false,
          dialogClass: 'custom-dialog',
          close: function () {
            PopupDialog.Stack.pop();
            if (functionCallback) {
              functionCallback(PopupDialog.Result);
            }
          },
          beforeClose: function () {
            if (functionBeforeClose) {
              functionBeforeClose(PopupDialog.Result);
            }
            if (!continueClose) {
              return false;
            }
          },
          closeOnEscape: closeable,
          open: function (event, ui) {
            if (typeof (fluidDialog) != 'undefined') {
              fluidDialog();
            }
            $('.ui-dialog-titlebar').addClass('custom-header-dialog');
            PopupDialog.Stack.push($(this));
            if (!closeable) {
              $(".ui-dialog-titlebar-close").hide();
            }
            if (openCallback) {
              openCallback();
            }

          },
          title: title
        }).dialog('open');
      }
      })
      return false;
  },
  Close: function () {
    var dialog = PopupDialog.Stack[PopupDialog.Stack.length - 1];
    $(dialog).dialog('close');
    $(dialog).dialog('destroy').remove();
  },
  CloseAbortBeforeCloseEvent: function () {
    var dialog = PopupDialog.Stack[PopupDialog.Stack.length - 1];
    $(dialog).dialog('destroy').remove();
  }
}

$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
  fluidDialog();
});

function fluidDialog() {
  var $visible = $(".ui-dialog:visible");
  // each open dialog
  $visible.each(function () {
    var $this = $(this);

    //jquery <= 1.9
    var dialog = $this.find(".ui-dialog-content").data("dialog");
    //jquery > 1.9
    if (dialog == undefined)
    {
      dialog = $this.find(".ui-dialog-content").data("uiDialog");
    }
    if (dialog != undefined) {
      // if fluid option == true
      if (dialog.options.maxWidth && dialog.options.width) {
        // fix maxWidth bug
        $this.css("max-width", dialog.options.maxWidth);
        //reposition dialog
        dialog.option("position", dialog.options.position);
      }

      if (dialog.options.fluid) {
        // namespace window resize
        $(window).on("resize.responsive", function () {
          //reposition dialog
          dialog.option("position", dialog.options.position);
        });
      }
    }
  });
}
