/*
 * RailsAdmin remote form @VERSION
 *
 * License
 *
 * http://www.railsadmin.org
 *
 * Depends:
 *   jquery.ui.core.js
 *   jquery.ui.widget.js
 *   jquery.ui.dialog.js
 */
(function(a){a.widget("ra.remoteForm",{_create:function(){var b=this,c=b.element,d=c.find("select").data("edit-url");typeof d!="undefined"&&d.length&&c.find(".ra-multiselect option").live("dblclick",function(a){b._bindModalOpening(a,d.replace("__ID__",this.value))}),c.find(".create").unbind().bind("click",function(c){b._bindModalOpening(c,a(this).data("link"))}),c.find(".update").unbind().bind("click",function(d){(value=c.find("select").val())?b._bindModalOpening(d,a(this).data("link").replace("__ID__",value)):d.preventDefault()})},_bindModalOpening:function(b,c){b.preventDefault(),widget=this;if(a("#modal").length)return!1;var d=this._getModal();a.ajax({url:c,beforeSend:function(a){a.setRequestHeader("Accept","text/javascript")},success:function(a,b,c){d.find(".modal-body").html(a),widget._bindFormEvents()},error:function(a,b,c){d.find(".modal-body").html(a.responseText)},dataType:"text"})},_bindFormEvents:function(){var b=this,c=this._getModal(),d=c.find("form"),e=c.find(":submit[name=_save]").html(),f=c.find(":submit[name=_continue]").html();c.find(".form-actions").remove(),d.attr("data-remote",!0),c.find(".modal-header-title").text(d.data("title")),c.find(".cancel-action").unbind().click(function(){return c.modal("hide"),!1}).html(f),c.find(".save-action").unbind().click(function(){return d.submit(),!1}).html(e),d.bind("ajax:complete",function(d,e,f){if(f=="error")c.find(".modal-body").html(e.responseText),b._bindFormEvents();else{var g=a.parseJSON(e.responseText),h='<option value="'+g.id+'" selected>'+g.label+"</option>",i=b.element.find("select").filter(":hidden");if(b.element.find(".filtering-select").length){var j=b.element.find(".filtering-select").children(".ra-filtering-select-input");j.val(g.label),i.find("option[value="+g.id+"]").length||i.html(h).val(g.id)}else{var j=b.element.find(".ra-filtering-select-input"),k=b.element.find(".ra-multiselect");k.find("option[value="+g.id+"]").length?(i.find("option[value="+g.id+"]").text(g.label),k.find("option[value= "+g.id+"]").text(g.label)):(i.prepend(h),k.find("select.ra-multiselect-selection").prepend(h))}b._trigger("success"),c.modal("hide")}})},_getModal:function(){var b=this;return b.dialog||(b.dialog=a('          <div id="modal" class="modal fade">            <div class="modal-header">              <a href="#" class="close" data-dismiss="modal">&times;</a>              <h3 class="modal-header-title">...</h3>            </div>            <div class="modal-body">              ...            </div>            <div class="modal-footer">              <a href="#" class="btn cancel-action">...</a>              <a href="#" class="btn btn-primary save-action">...</a>            </div>          </div>').modal({keyboard:!0,backdrop:!0,show:!0}).on("hidden",function(){b.dialog.remove(),b.dialog=null})),this.dialog}})})(jQuery)