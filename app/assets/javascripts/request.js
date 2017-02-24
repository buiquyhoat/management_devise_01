function generate_name(parent_model, model, index, attribute)
{
  return parent_model + '[' + model +'s_attributes][' + index + '][' + attribute + ']';
}

function generate_id(parent_model, model, index, attribute)
{
  return parent_model + '_' +model + 's_attributes_'+ index + '_' + attribute;
}

function resetIndex(table_name, parent_model, model){
  $('#'+table_name+' tbody tr').each(function(index) {
    var description = $(this).find('.request_detail_description')
    var number = $(this).find('.request_detail_number')
    var devide_category = $(this).find('.device-caterory')

    $(description).attr("id", generate_id(parent_model, model,index, "description"));
    $(description).attr("name", generate_name(parent_model, model,index, "description"));

    $(devide_category).attr("id", generate_id(parent_model, model,index, "device_category_id"));
    $(devide_category).attr("name", generate_name(parent_model, model,index, "device_category_id"));
    $(number).attr("id", generate_id(parent_model, model,index, "number"));
    $(number).attr("name", generate_name(parent_model, model,index, "number"));
  });
}

function remove_request_detail(button, table_name, parent_model, model){
  var request_detail_id = $(button).closest("tr").next().attr('value')
  if (request_detail_id !== undefined)
  {
    if(confirm(I18n.t("request.confirm"))){
      $.ajax({
        type: 'DELETE',
        url: '/request_details/'+ request_detail_id,
        dataType: 'json',
        success: function(data){
          if (data.success === false)
          {
            alert(data.message);
          }
          else
          {
            $(button).closest("tr").next().remove();
            $(button).closest("tr").remove();
            resetIndex(table_name,parent_model,model);
          }
        },
        error: function (error_message){
          alert(error_message);
        }
      });
    }
    else{
        return false;
    }
  }
  else
  {
    $(button).closest("tr").remove();
    resetIndex(table_name,parent_model,model);
  }
}

function update_request(button,request_id, url){

  if (request_id !== undefined)
  {
    $.ajax({
      type: 'PUT',
      url: url,
      dataType: 'json',
      data: {"request_id": request_id, "request_status_id": $(button).find("label.active input").val()},
      success: function(data){
        if (data.success === false)
        {
          alert(data.message);
        }
        else
        {
          $('#form-submit-action'+ request_id).submit()
        }
      },
      error: function (error_message){
        alert(error_message);
      }
    });
  }
}
